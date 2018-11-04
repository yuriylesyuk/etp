
var fs = require('fs');
var fp = require("lodash/fp");

var gu = require("./generateUtilities");


// three files are generated: 
//
//   edge-ccv-deployconfig-p1.sh     to upload files to gcp project
//   edge-ccv-deployconfig-p2.sh     to distribute files across consul cluster
//   edge-ccv-setup.sh               to configure iptables and sidecar proxies


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

// light-weight version of gatherComp [could be REFACTOR?]
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


function gencompportconfig( cccomp, ccport, ccoffset, servers, clients, genNodeId, configFileTransfer, ccvsetup, program ){

    //-----------------------------------------------------------------

    // -- enumeration union of server and client nodes to cc offset;
    var nodes = fp.sortBy(["dcid","nid"])(fp.unionBy("ip")(servers,clients));

    
    var ports = fp.map( node => { return { ip: node.ip, port: ++ccoffset } } )( nodes );

    servers = fp.map(node=> { node.port = fp.find({ip:node.ip})(ports).port; return node; } )(servers);

    clients = fp.map(node=> { node.port = fp.find({ip:node.ip})(ports).port; return node; } )(clients);

    var servernodes = fp.join(",")( fp.map( n=> genNodeId( n.dcid, n.nid ) )(servers) );
    var clientnodes = fp.join(",")( fp.map( n=> genNodeId( n.dcid, n.nid ) )(clients) );

    // -- generate consul connect configuration

    var ccCompPort = fp.template( '<%= cccomp %>-<%= ccport %>' )({ cccomp: cccomp.toLowerCase(), ccport: ccport });

    var serviceName = fp.template( 'edge-<%= ccCompPort %>' )({ ccCompPort: ccCompPort});




    ccvsetup.write( "#\n" );
    ccvsetup.write( `## configuration for ${serviceName}\n` );
    ccvsetup.write( "#\n" );
    
    
    var upstreams = "";

    fp.forEach( node => {

        var n = genNodeId( node.dcid, node.nid );
    
        var serviceNodeName = fp.template( 'edge-<%= n %>-<%= ccCompPort %>' )({ n: n, ccCompPort: ccCompPort});
        var serviceFileName = serviceNodeName + '.json';
    
        // loop for a client to call to all servers
        // server-set iptables fragment 
        // $node: $port: 1.1
        ccvsetup.write( 
            fp.template(
                'ansible <%= clientnodes %> -ba "iptables -t nat -A OUTPUT -p tcp -d <%= ip %> --dport <%= ccport %> -j DNAT --to-destination 127.0.0.1:<%= port %>"\n'
            )({ clientnodes: clientnodes, ip: node.ip, ccport: ccport, port: node.port })
        );

        // node: $node: $port: 1.2
        ccvsetup.write( 
            fp.template(
                'ansible <%= n %> -ba "iptables -t nat -A OUTPUT -p tcp -d 127.0.0.1 --dport <%= ccport %> -j DNAT --to-destination <%= ip %>:<%= ccport %>"\n'
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

        // trasfer config file to target platform, ie, GCP project
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
        upstreams += fp.template( "-upstream <%= service %>:<%= port %> " )({ service: serviceNodeName, port: node.port });

    })(servers)

    ccvsetup.write( "#\n" );

    // client nodes sidecars
    // dc1-$node sidecar-for edge-$CC_COMP-$CC_PORT
    ccvsetup.write( 
        fp.template( 
            "ansible <%= clientnodes %> -m shell -a 'nohup consul connect proxy -service <%= service %> $upstreams  &> /opt/hashicorp/consul/logs/<%= service %>.log & echo $! > /opt/hashicorp/consul/logs/<%= service %>.pid'\n"
        )({ clientnodes: clientnodes, service: serviceName, upstreams: upstreams})
    );

    ccvsetup.write( "#\n" );
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

    var configFileTransfer = configFilePlatformTranfer( platform, ccvconfig1, ccvconfig2 );

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
