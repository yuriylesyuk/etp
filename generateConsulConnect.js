
var fs = require('fs');
var fp = require("lodash/fp");

var gu = require("./generateUtilities");


// three files are generated: 
//
//   edge-ccv-deployconfig-p1.sh     to upload files to gcp project
//   edge-ccv-deployconfig-p2.sh     to distribute files across consul cluster
//   edge-ccv-setup.sh               to configure iptables and sidecar proxies


// ### Add node isolation


// [ ] TODO: refactor two next loops into one function
// [ ] ?collect nodes for ansible node list
// [ ] TODO: refactor to edge-defs.json as SSOT [single source of truth]

var ccConfigurations = [

    { cccomp: "ZK", ccport: 2181, ccoffset: 30210, comps: [ "MS", "R", "MP", "QS", "PS"] },
    { cccomp: "ZK", ccport: 2888, ccoffset: 30280, comps: [ "ZK"] },
    { cccomp: "ZK", ccport: 3888, ccoffset: 30380, comps: [ "ZK"] },

    { cccomp: "CS", ccport: 7000, ccoffset: 30700, comps: [ "CS"] },
    { cccomp: "CS", ccport: 9042, ccoffset: 30520, comps: [ "CS"] },
    { cccomp: "CS", ccport: 9160, ccoffset: 30600, comps: [ "CS"] },

    { cccomp: "MS", ccport: 8080, ccoffset: 30800, comps: [ "MS", "R", "MP", "QS", "PS" ] }

]

// TODO:
//  MS: 4526

// DP --> R 59002 << REJECT

// TODO:: all others

var systemIgnorePorts = [ 22 ]

var ccIgnoreConfigurations = [
    { cccomp: "MS", ports: [ 1099, 8443 ]},
    { cccomp: "UI", ports: [ 9443 ]},
    // [ ] TODO: refactor to topology as source of vhost definitions
    { cccomp: "R", ports: [ 15999, 59001, 9001,9002,9003,9004,9005 ]}
]

// light-weight version of gatherComp [could be REFACTORED?]
function gatherNodes( topology, compList ){
    var nodes = [];
    fp.map(
        region => fp.map(
            subnet =>  
                fp.reduce( (nodes, node) => {

                    if( fp.intersection( compList )( fp.map( c => c.comp )(node.components) ).length > 0 ){
                            nodes.push( { dcid: region.id, nid: node.id, ip: node.ip } )
                        }
                    return nodes;
            }, nodes )(subnet.nodes)
        )(region.subnets)
    )(topology.regions);

    return nodes;
}

function genisolationconfig( topology, genNodeId, ccvsetup ){

    // all nodes

    // [ ] TODO: factor-out inot generateUtilities.js (same in generateInventory.js)
    var nodes = fp.flatMap( region => 
            fp.flatMap( subnet => 
                fp.map( node => {
                    node.dcid = region.id;
                    node.subnet = subnet.name;
                    return node;
                } )(subnet.nodes) 
            )(region.subnets)
        )(topology.regions);

    var listofnodes = fp.join(",")( fp.map( n=> genNodeId( n.dcid, n.id ) )(nodes) );

    ccvsetup.write( "#\n" );
    ccvsetup.write( `## reset CONSUL_ custom chains\n` );
    ccvsetup.write( "#\n" );

    fp.map( chaindef => {
            ccvsetup.write(
                fp.template(
                    `set +e\n`
                    +
                    'ansible <%= nodes %> -ba "iptables -t <%= table %> -F <%= customchain %>"\n'
                    +
                    'ansible <%= nodes %> -ba "iptables -t <%= table %> -X <%= customchain %>"\n'
                    +
                    `set -e\n`
                    +
                    'ansible <%= nodes %> -ba "iptables -t <%= table %> -N <%= customchain %>"\n'
                    +
                    'ansible <%= nodes %> -ba "iptables -t <%= table %> -A <%= chain %> -p tcp -j <%= customchain %>"\n'
                    +
                    // pass the consul:consul traffic through, including proxy sidecars; meaningful for OUTPUT chains only
                    '<% if( chain == "OUTPUT" ) { %>'
                        +
                        'ansible <%= nodes %> -ba "iptables -t <%= table %> -A <%= customchain %> -m owner --uid-owner consul -j RETURN"\n'
                        +
                        'ansible <%= nodes %> -ba "iptables -t <%= table %> -A <%= customchain %> -m owner --gid-owner consul -j RETURN"\n'
                        +
                    '<% } %>'
                    +
                    '\n' )
                (chaindef)
            )
        })([
            { nodes: listofnodes, table: "filter", chain: "INPUT", customchain: "CONSUL_INPUT" }, 
            { nodes: listofnodes, table: "nat", chain: "OUTPUT", customchain: "CONSUL_OUTPUT" }
        ]
    );

    ccvsetup.write( "#\n" );
    ccvsetup.write( "## node traffic control\n" );
    ccvsetup.write( "#\n\n" );


    fp.forEach( node => {
        var n = genNodeId( node.dcid, node.id );

        //-------------------------------------------------------------
        // 
        //-------------------------------------------------------------
        // Collect ports for components that are redirected to proxies
        // ie: 2181,2888,3888,7000,7199,8080,9000,4526,9042,9160,10389

        // for this node, collect components on the node and collect their ports from ccConfigurations
        var rejectposts = [];
        fp.reduce( ( ports, comp) => {
            // collect all ports for the component in ccConfigurations
            fp.map( ccomp => {
                ports.push( ccomp.ccport );
            })(fp.filter( {cccomp: comp} )(ccConfigurations));

            return ports;
        }, rejectposts)(fp.map(comp=>comp.comp)(node.components));

        // Collect port that are ignored

        // [ ] TODO: refactor to the ones that are not in ccComponents
        var acceptports = []
        acceptports.push( systemIgnorePorts );
        fp.reduce( ( ports, comp) => {
            // collect all ports for the component in ccConfigurations
            fp.map( ccomp => {
                ports.push( ccomp.ports );
            })(fp.filter( {cccomp: comp} )(ccIgnoreConfigurations));

            return ports;
        }, acceptports)(fp.map(comp=>comp.comp)(node.components));

        // REJECT traffic that is supposed to be redirected via proxies
        ccvsetup.write( 
            fp.template(
                'ansible <%= n %> -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports <%= rejectposts %> -m state --state NEW,ESTABLISHED -j REJECT"\n'
            )({ n: n, rejectposts: rejectposts })
        );

        // ACCEPT traffic that is processed by components
        ccvsetup.write( 
            fp.template(
                'ansible <%= n %> -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports <%= acceptposts %> -m state --state NEW,ESTABLISHED -j ACCEPT"\n'
            )({ n: n, acceptposts: acceptports })
        );
        ccvsetup.write( "\n" );

    })(nodes);

    ccvsetup.write( "#\n\n\n" );
}

function gencompportconfig( cccomp, ccport, ccoffset, servers, clients, genNodeId, configFileTransfer, ccvsetup, program ){

    //-----------------------------------------------------------------

    // -- enumeration union of server and client nodes to cc offset;
    var nodes = fp.sortBy(["dcid","nid"])(fp.unionBy("ip")(servers,clients));

    
    var ports = fp.map( node => { return { ip: node.ip, port: ++ccoffset } } )( nodes );

    servers = fp.map(node=> { node.port = fp.find({ip:node.ip})(ports).port; return node; } )(servers);

    clients = fp.map(node=> { node.port = fp.find({ip:node.ip})(ports).port; return node; } )(clients);

    var servernodes = fp.join(",")( fp.map( n=> genNodeId( n.dcid, n.nid ) )(servers) );
    var clientnodes = fp.join(",")( fp.map( n=> genNodeId( n.dcid, n.nid ) )(clients) );

    //
    // -- generate consul connect configuration by component:port
    //

    var ccCompPort = fp.template( '<%= cccomp %>-<%= ccport %>' )({ cccomp: cccomp.toLowerCase(), ccport: ccport });

    var serviceName = fp.template( 'edge-<%= ccCompPort %>' )({ ccCompPort: ccCompPort});

   
    ccvsetup.write( "#\n" );
    ccvsetup.write( `## configuration for ${serviceName}\n` );
    ccvsetup.write( "#\n" );
    
    // emit upstreams: name and file definitions
    var upstreamName = fp.template( 'edge-<%= ccCompPort %>' )({ ccCompPort: ccCompPort});
    var upstreamFile = upstreamName + ".json";

    var upstreams = [];

    fp.forEach( node => {

        var n = genNodeId( node.dcid, node.nid );
    
        var serviceNodeName = fp.template( 'edge-<%= n %>-<%= ccCompPort %>' )({ n: n, ccCompPort: ccCompPort});
        var serviceFileName = serviceNodeName + '.json';
    
        //-------------------------------------------------------------
        // loop for a client to call to all servers
        //-------------------------------------------------------------
        // server-set iptables fragment 
        // $node: $port: 1.1
        ccvsetup.write( 
            fp.template(
                'ansible <%= clientnodes %> -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d <%= ip %> --dport <%= ccport %> -j DNAT --to-destination 127.0.0.1:<%= port %>"\n'
            )({ clientnodes: clientnodes, ip: node.ip, ccport: ccport, port: node.port })
        );

        // node: $node: $port: 1.2
        ccvsetup.write( 
            fp.template(
                'ansible <%= n %> -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport <%= ccport %> -j DNAT --to-destination <%= ip %>:<%= ccport %>"\n'
            )({ n: n, ip: node.ip, ccport: ccport })
        );


        // service sidecar configuration 
        //// cat << EOF | sudo tee /opt/hashicorp/config/edge-$node-$CC_COMP-CC_PORT.json

        ccvsetup.write(     
            fp.template( 
                '# file: "<%= service %>.json"\n' 
            )({ service: serviceNodeName })
        );


        // cat << EOF > "edge-$n-$CC_COMP-$CC_PORT.json"
        var ccservicedef = fs.createWriteStream( program.directory + '/' + serviceFileName );
        ccservicedef.write(   
            fp.template( `{
    "services": [
        {
            "name": "<%= service %>",
            "port": <%= ccport %>,
            "connect": { "sidecar_service": {} }
        }
    ]
}
` )({ service: serviceNodeName, ccport: ccport})
        );

        ccservicedef.end();

        // transfer a future-generated upsteam file same for all nodes to each node
        configFileTransfer( n, upstreamFile )

        // transfer config file to target platform, ie, GCP project
        configFileTransfer( n, serviceFileName )
    
        // server-each sidecar
        // dc1-$node sidecar-for edge-$node-$CC_COMP-$CC_PORT
        ccvsetup.write(
            fp.template(
                "ansible <%= n %> -m shell -a 'nohup consul connect proxy -sidecar-for <%= service %>  &> /opt/hashicorp/consul/logs/<%= service %>.log &  echo $! > /opt/hashicorp/consul/logs/<%= service %>.pid'\n"
            )({ n: n, service: serviceNodeName})
        );

        ccvsetup.write( "\n" );

        // sider upstream collection
        upstreams.push( fp.template( `{
                                "destination_name": "<%= service %>",
                                "local_bind_port": <%= port %>
                            }`)({ service: serviceNodeName, port: node.port })
        );

    })(servers)

    // emit upstreams: config definition
    var ccupstreamdef = fs.createWriteStream( program.directory + '/' + upstreamFile );
    ccupstreamdef.write(  
        fp.template(`{
    "services": [
            {
            "name": "<%= upstream %>",
            "port": <%= port %>,
            "connect": {
                "proxy": {
                    "config": {
                        "upstreams": [
                            <%= upstreams %>
                        ]
                    }
                }
            }
        }
    ]
}` )({ upstream: upstreamName, port: ccport, upstreams: upstreams.join(", ") }) 
    );
    ccupstreamdef.end();           

    // 
    // dc1-$node sidecar-for edge-$CC_COMP-$CC_PORT
    ccvsetup.write( 
        fp.template( 
            "ansible <%= clientnodes %> -m shell -a 'nohup consul connect proxy -service <%= service %> &> /opt/hashicorp/consul/logs/<%= service %>.log & echo $! > /opt/hashicorp/consul/logs/<%= service %>.pid'\n"
        )({ clientnodes: clientnodes, service: serviceName, upstreams: upstreams})
    );

    ccvsetup.write( "#\n\n\n" );
}

// Params:
//    CONSUL_NODE=$1
//    CONFIG_FILE=$2
var configFilePlatformTranfer = fp.curry( ( platform, configfile1, configfile2, n, servicefile ) => {

    configfile1.write(
        fp.template(
            'gcloud compute --project "<%= project %>" scp --zone "<%= zone %>"  <%= configdir %>/<%= servicefile %> "<%= jumpbox %>:/tmp"\n'
        )({ project: platform.CC_PROJECT, configdir: platform.CC_CONFIG_DIR, zone: platform.CC_ZONE, servicefile: servicefile, jumpbox: platform.CC_JUMPBOX })

    );

    configfile2.write(
        fp.template(
            'ansible <%= n %> -m copy -a "src=/tmp/<%= servicefile %> dest=/opt/consul-install/"\n'
        )({ n: n, servicefile: servicefile })

    );

    configfile2.write(
        fp.template(
            'ansible <%= n %> -b -m copy -a "remote_src=yes src=/opt/consul-install/<%= servicefile %> dest=/etc/consul.d"\n'
        )({ n: n, servicefile: servicefile })
    );


    configfile2.write( "\n" );

});


module.exports = function ( topologyFile, outputFile, program ){
    
    var portdefs = require("./edge-defs.json");

    var topology = require( topologyFile );
    
    var genNodeId = gu.genRegionIdNodeId( topology.regions.length === 1 );


    // TODO: platform/project deps

    /* example:

export CC_PROJECT=project-id
export CC_ZONE=europe-west3-a
export CC_JUMPBOX=jumpbox
export CC_CONFIG_DIR=~/projects/edge-ccv

    */
    var platform = {
        CC_SETUP: program.directory + '/' + "edge-ccv-setup.sh",
        CC_DEPLOY_CONFIG1: program.directory + '/' + "edge-ccv-deployconfig-p1.sh",
        CC_DEPLOY_CONFIG2: program.directory + '/' + "edge-ccv-deployconfig-p2.sh",
        
        
        CC_PROJECT: process.env.CC_PROJECT || "project-id",
        CC_ZONE: process.env.CC_ZONE || "europe-west3-a",
        CC_JUMPBOX: process.env.CC_JUMPBOX || "jumpbox",
        CC_CONFIG_DIR: process.env.CC_CONFIG_DIR || "~/projects/edge"
    }


    var ccvsetup = fs.createWriteStream( platform.CC_SETUP );
    var ccvconfig1 = fs.createWriteStream( platform.CC_DEPLOY_CONFIG1 );
    var ccvconfig2 = fs.createWriteStream( platform.CC_DEPLOY_CONFIG2 );

    //
    // transfer proxy def file to target nodes
    //
    var configFileTransfer = configFilePlatformTranfer( platform, ccvconfig1, ccvconfig2 );

    //
    //  define consul:consul user:group for each consul node
    //
    // [ ] TODO:


    //
    //  reset and define CONSUL_ custom chains
    //
    genisolationconfig( topology, genNodeId, ccvsetup )

    //
    // generate component iptables configuration
    //

    ccvsetup.write( "#\n" );
    ccvsetup.write( "## client nodes sidecars\n" );
    ccvsetup.write( "#\n" );

    fp.map( cconfig => {

        // gencompportconfig \
        //  zk \
        //  2181 \
        //  "n1:10.156.0.7:30211 n2:10.156.0.4:30212 n3:10.156.0.3:30213" \
        //  "n1:10.156.0.7:30211 n2:10.156.0.4:30212 n3:10.156.0.3:30213 n4:10.156.0.8:30214 n5:10.156.0.5:30215"
        //
        // server comp, server port, server nodes with cc ports, client nodes with cc ports
        // -- collect all server nodes;
        var servers = gatherNodes( topology, [ cconfig.cccomp ] );

        // -- collect all client nodes that contain any client component type;
        var clients = gatherNodes( topology, cconfig.comps );

        gencompportconfig( cconfig.cccomp, cconfig.ccport, cconfig.ccoffset, servers, clients, genNodeId, configFileTransfer, ccvsetup, program );

    })(ccConfigurations);




    
    // config files epilog
    ccvconfig2.write( 'ansible consul -a "consul reload"\n' );

    ccvsetup.end();
    ccvconfig1.end();
    ccvconfig2.end();
}
