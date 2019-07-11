
var fs = require('fs');
var fp = require("lodash/fp");

var gu = require("./generateUtilities")

// TODO: move to utils
function rgb(r, g, b){
    function c(d){
        var h = d.toString(16);        
        return h.length ===1 ? "0" + h : h;
    }

    return "#" + c(r) + c(g) + c(b);
}





var ipT = fp.template( "IPDC<%= dcid %>N<%= ('0'+nodeid).slice(-2) %>" );
var drT = fp.template( "$<%= ipref %>:<%= dcid %>,<%= rackid %>" );
var ndT = fp.template( "<%= nodeipref %> # <%= roles %>" );

function getIpRefObject( ipref ){
    // ignore "regexpmatch" using tail
    return fp.zipObject( [ "dcid", "nodeid" ] )(fp.tail(/\/dc\/(\d+)\/n\/(\d+)/.exec( ipref )).map(i=>Number(i)));
}

function getNodeByIpRef( nodes, ipref){

    return fp.find( getIpRefObject( ipref ) )( nodes );
}

// supported compType:
//    * all components
//    * nodes node list
//    * XX component
function gatherComp( topology, compType, compList ){
    var genNodeId = gu.genRegionIdNodeId( topology.regions.length === 1 );

    var comps = [];
    fp.map(
        region => fp.map(
            subnet =>  
                fp.reduce( (css, node) => {
                    // compType:
                    //      "all" to return for any component; no third parameter 
                    //      "byNodes" to return for a list of nodes, in this case, third parameter is a list of nodes
                    //      "XX" component type to return for specific type of component; no third parameter
                    //
                    if( compType === "*" 
                     || (compType === "nodes" &&  fp.find( { dcid: region.id, nid: node.id} )( compList ) )
                     || fp.find( { comp: compType } )(node.components) ){
                        var c = { 
                            dcid: region.id, 
                            nodeid: node.id, 
                            rackid: (typeof node.rack === "undefined"? 1 : node.rack), 
                            ip: node.ip
                        };

                        c.regionidnodeidref = genNodeId( c.dcid, c.nodeid );

                        c.ipref = ipT({ dcid: c.dcid, nodeid: c.nodeid });
                        c.drref = drT({ ipref: c.ipref, dcid: c.dcid, rackid: c.rackid } );


                        // "Invert" components
                        c.components = fp.keyBy("comp")(node.components);
                        c.roles = fp.map(comp => comp.comp)(node.components).join(", ");

                        c.nodeipref = ndT({ nodeipref: fp.padCharsEnd(' ')(34)( c.ipref + "=" + c.ip ), roles: c.roles });
                        comps.push( c );
                    }
                    return comps;
                }, comps )(subnet.nodes)
        )(region.subnets)
    )(topology.regions);

    return fp.sortBy(["dcid","nodeid"])(comps);
}

var compName = {
    "MS": "edge-managementserver",

    "MS": "edge-management-server", 
    "UI": "edge-sap-ui", 
    "R": "edge-router", 
    "MP": "edge-message-processor", 
    "QS": "edge-qpid-server", 
    "PS": "edge-postgres-server", 
    "ZK": "apigee-zookeeper", 
    "CS": "apigee-cassandra", 
    "OL": "apigee-openldap", 
    "QD": "apigee-qpidd", 
    "PG": "apigee-postgresql",
    "PGm": "apigee-postgresql",
    "PGs": "apigee-postgresql",

    "DP": "apigee-drupal-devportal", 

    "BS": "baas-sap-usergrid",
    "BP": "baas-sap-portal",
    "ES": "apigee-elasticsearch",
    "TC": "apigee-tomcat",

    "IF": "apigee-influx",
    "TG": "apigee-telegraf",
    "GF": "apigee-grafana"
}

// [ ] Install Rule: for v. 17.01+ dp might be different

// [ ] Install Rule: ps installs PS and PG*
// [ ] Install Rule: qs installs QS and QID
// [ ] Install Rule: if MS and OL on different nodes, USER_LDAP_REMOTE_HOST=y
// [ ] Install Rule: if MS and UI on same node, do MS, ignore UI for this node


// TODO: WIP: REFACTOR: finish with IF, TG, FG, PGd
var compInst = {
    "ZK": { comp: "zk", ansible: "edge-comp-setup.yml" }, 
    "CS": { comp: "c", ansible: "edge-comp-setup.yml" }, 
    "OL": { comp: "ld", ansible: "edge-comp-setup.yml" }, 
    "MS": { comp: "ms", ansible: "edge-comp-setup.yml" }, 
    "UI": { comp: "ui", ansible: "edge-comp-setup.yml" },
    "QS": { comp: "qs", ansible: "edge-comp-setup.yml" }, 
    "PS": { comp: "ps", ansible: "edge-comp-setup.yml" }, 
    "R": { comp: "r", ansible: "edge-comp-setup.yml" }, 
    "MP": { comp: "mp", ansible: "edge-comp-setup.yml" }, 

    "DP": { comp: "dp", ansible: "edge-comp-setup.yml" }, 
    "PGd": { comp: "pdb", ansible: "edge-comp-setup.yml" },

    "ES": { comp: "e", ansible: "edge-comp-setup.yml" },
    "BS": { comp: "b", ansible: "edge-comp-setup.yml" }, 
    "BP": { comp: "p", ansible: "edge-comp-setup.yml" }, 

    "IF": { comp: "influxdb", ansible: "edge-comp.yml" }, 
    "TG": { comp: "telegraf", ansible: "edge-comp.yml" }, 
    "GF": { comp: "grafana", ansible: "edge-comp.yml" }
}


var getTopologyPropertyFromTopologyPortdefs = fp.curry( ( portdefs, topology, property ) => {
    var val = fp.get( property, topology )
    return typeof val === "undefined" ? fp.get( property, portdefs ) : val;
})


var getComponentPropertyFromTopologyPortdefs = fp.curry( ( portdefs, topology, component, property ) => {
    var val = fp.get( property, topology )
    return typeof val === "undefined" ? fp.get( property, portdefs ) : val;
})

// TODO: move to utils
// TODo: DOCO:
// wrapper over <stream>.write that implements Optional/Required for environment parameters
//   if flag [O/R] is O, nothing is written in in the stream and therefore the default for Edge 
//    install command is used. If needed to be overwritten, then define it in customer.<parameter> in 
//    topology file. if flag is missed or "R", whatever is passed is generated.
//      
//   
function streamProperty( stream, parameter, value, optional  ){
    var optional = (typeof optional === "undefined" )? "R" : optional;

    // WARNING: Required parameters undefined
    if( typeof value === "undefined" && optional === "R" ){
        ruleWarning( `Required Parameter: ${parameter} is undefined.`)
    }

    if( !( typeof value === "undefined" && optional === "O") ){
        stream.write( `${parameter}=${value}\n` );
    }
}
 

// TODO: move to utils
// TODO: Refactor
function ruleWarning( w ){

    if( typeof w === 'string' && w.length != 0 ){
        console.log( "WARNING: " + w);
    }if( Array.isArray(w) && w.length != 0 ){ 
        // array of string
        console.log( "WARNING: " + w );
    }
}


// If component requires custum configuration file, the table provides parametrization information for it

// NOTE: in array to guarantee traversal order; shifted to object for lookup retrieval
// in case of multiple MSs, For MS .primary = true
var compConfigurations = [
    [ "OLMSUI", {
        install: "ms",
        ansible: "edge-comp-setup.yml",
        comps: [ "OL", "MS", "UI"],
        pred: true,
        config: [ "hosts", "hostip", "bind", "ms-host", "ms-creds", "license", "ldap-host", "dc", "rmp-pod", "cs-creds", "cs-hosts", "zk-hosts", "pg-creds" ]
    } ],
    [ "RMP", {
        install: "rmp",
        ansible: "edge-comp-setup.yml",
        comps: [ "R", "MP" ],
        pred: true,
        config: [ "hosts", "dc", "rmp-pod" ]
    } ],
    [ "DS", {
        install: "ds",
        ansible: "edge-comp-setup.yml",
        comps: [ "ZK", "CS" ],
        pred: true,
        config: [ "hosts", "hostip", "run-as", "cs-creds", "cs-hosts" ]
    } ],
    [ "SAX", {
        install: "sax",
        ansible: "edge-comp-setup.yml",
        comps: [ "QS", "PS" ],
        pred: true,
        config: [ "hosts", "hostip", "dc", "rmp-pod", "run-as", "pg-conf", "pg-creds" ]
    } ],
    [ "MS", {
        install: "ms",
        ansible: "edge-comp-setup.yml",
        comps: [ "MS" ],
        pred: true,
        config: [ "hosts", "hostip", "ms-host", "ms-creds", "license", "ldap-host", "ldap-creds", "dc", "rmp-pod", "cs-creds", "cs-hosts", "zk-hosts", "pg-creds" ]
    } ],
    [ "OL", {
        install: "ld",
        ansible: "edge-comp-setup.yml",
        comps: [ "OL" ],
        pred: true,
        config: [ "hosts","ldap-host", "ldap-creds", "ldap-conf", "run-as" ]
    } ],
    [ "UI", {
        install: "ui",
        ansible: "edge-comp-setup.yml",
        comps: [ "UI" ],
        pred: true,
        config: [ "hosts", "brand", "hostip", "ms-host", "ms-creds", "run-as", "ldap-host", "smtp" ]
    } ],
    [ "CS", {
        install: "c",
        ansible: "edge-comp-setup.yml",
        comps: [ "CS" ],
        pred: true,
        config: [ "hosts", "hostip", "run-as", "cs-creds", "cs-hosts" ]
    } ],
    [ "ZK", {
        install: "zk",
        ansible: "edge-comp-setup.yml",
        comps: [ "ZK" ],
        pred: true,
        config: [ "hosts", "hostip", "run-as", "zk-hosts" ]
    } ],
    [ "R",  {
        install: "r",
        ansible: "edge-comp-setup.yml",
        comps: [ "R" ],
        pred: true,
        config: [ "hosts", "dc", "rmp-pod" ]
    } ],
    [ "MP", {
        install: "mp",
        ansible: "edge-comp-setup.yml",
        comps: [ "MP" ],
        pred: true,
        config: [ "hosts", "dc", "rmp-pod" ]
    } ],
    [ "PS", {
        install: "ps",
        ansible: "edge-comp-setup.yml",
        comps: [ "PS" ],
        pred: true,
        config: [ "hosts", "hostip", "dc", "rmp-pod", "run-as", "pg-conf", "pg-creds" ]
    } ],
    [ "QS", {
        install: "qs",
        ansible: "edge-comp-setup.yml",
        comps: [ "QS" ],
        pred: true,
        config: [ "hosts", "dc", "rmp-pod" ]
    } ],
    [ "UG", {
        install: "e",
        ansible: "edge-comp-setup.yml",
        comps: [ "UG" ],
        pred: true,
        config: [ "hosts", "brand" ]
    } ],
    [ "BS", {
        install: "b",
        ansible: "edge-comp-setup.yml",
        comps: [ "BS" ],
        pred: true,
        config: [ "hosts", "smtp" ]
    } ],
    [ "DP", {
        install: "dp",
        ansible: "edge-comp-setup.yml",
        comps: [ "DP" ],
        pred: true,
        config: [ "hosts","brand" ]
    } ]
];
// Index values for lookup operations
var compConfigurationsIdx = fp.fromPairs(compConfigurations);

module.exports = function ( topologyFile, outputFile, program ){

    var portdefs = require("./edge-defs.json");

    var topology = require( topologyFile );

    var genNodeId = gu.genRegionIdNodeId( topology.regions.length === 1 );

    // I.E.: ...= getTopologyProperty("customer.cassPassword");
    var getTopologyProperty= getTopologyPropertyFromTopologyPortdefs( portdefs, topology );

    var getComponentProperty= getComponentPropertyFromTopologyPortdefs( portdefs, topology );


//--- TODO: Refactor to utils.js -------------
    // TODO: refactor to utils: CREF: generateSvgDiagram
    // make lookup table for component:isApigee check
    var isApigee = fp(portdefs.mappings.edge).reduce( (comps, comp) => {
        comps[comp.client.component] = comp.client.apigee;
        return comps;
    }, {});


//------------------------------



    // Collect  Node List; ordered by Node ID
    var nodes = fp.flatMap( region => 
            fp.flatMap( subnet => 
                fp.map( node => {
                    node.roles = fp.map(comp=>comp.comp)(node.components);

                    node.dcid = region.id;

                    node.subnet = subnet.name;

                    return node;
                } )(subnet.nodes) 
            )(region.subnets)
        )(topology.regions);

    // Templates
    var versionT = fp.template( "<%= comment%> Planet: <%= planet %>; Version: <%= version %>. Generated by etp at: <%= genat %>" );


    var htmlDocHeader = `
<head>
    <style>
        html * {
            font-size: small;
            font-family: "Arial Narrow", Arial, sans-serif !important;
        }

        table {
            border-collapse: collapse;
        }

        th {
            background-color: #dddddd;
        }

        th,
        td {
            border: 1px solid lightgrey;
        }

        tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .roleApigee {
            font-weight: bold;
            color: #f83100;
        }
        .role3rdParty {
            font-weight: bold;
            color: blue;s
        }
        .nodeID {
            font-weight: bold;
        }
    </style>
</head>`;

    var htmlInventoryHeader = `<table>\n
<thead>
    <tr>
        <th>DC</th>
        <th>Node #</th>
        <th>Role(s)</th>
        <th>Rack</th>
        <th>Subnet</th>
        <th>Hostname</th>
        <th>IP</th>
    </tr>
</thead>
<tbody>
`;

    var htmlInventoryFooter = "</tbody></table>\n\n"

    var htmlTDTemplate = fp.template( 
`<tr>
    <td>dc-<%= dcid %></td>
    <td>Node <bold><%= id %></bold></td>
    <td><%= roles %></td>
    <%= rackcell %>
    <td><%= subnet %></td>
    <td><%= hostname %></td>
    <td><%= ip %></td>
</tr>`);

    // https://s-media-cache-ak0.pinimg.com/564x/be/54/8f/be548f0f7eb1a29259a1e5c980b0d1e7.jpg
    var rackColor = {
        1: rgb( 21, 151, 2 ),
        2: rgb( 121, 235, 14 ),
        3: rgb( 198, 255, 72 ),
        4: rgb( 217, 255, 134 ),
        5: rgb( 164, 255, 84 ),
        6: rgb( 126, 239, 125 )
    }

    // http://img.bhs4.com/e1/8/e18d5f8ec497dc8baf51ca1d2462932e71d972ce_large.jpg
    var subnetColor = {
        1: rgb( 84, 87, 72 ),
        2: rgb( 180, 189, 131 ),
        3: rgb( 216, 208, 123 ),
        4: rgb( 242, 216, 109 ),
        5: rgb( 254, 196, 44 )
    }

    // Generate html table
    var htmlInventoryNodes = [];

    fp.reduce( (list, node) => {
        //console.log(node);
        list.push( htmlTDTemplate({
            dcid: node.dcid, 
            id: '<span class="nodeID">'+node.id+'</span>', 
            roles: fp.map( role => isApigee[role]?'<span class="roleApigee">'+role+'</span>':'<span class="role3rdParty">'+role+'</span>' )(node.roles).join(','), 
            rackcell: typeof node.rack === "undefined" ? '<td/>' : '<td style="text-align:right; background-color:'+rackColor[node.rack]+';">'+node.rack+'</td>', 
            subnet: node.subnet,
            hostname: node.hostname, 
            ip: node.ip}) );
        return list;
    }, htmlInventoryNodes)(fp.sortBy(["dcid","id"])(nodes));
    
    //



    //---------------------------------------
    var svgstream = fs.createWriteStream( outputFile );
    svgstream.write( htmlDocHeader );

    svgstream.write( htmlInventoryHeader );
    svgstream.write( htmlInventoryNodes.join('\n') );
    svgstream.write( htmlInventoryFooter );
    svgstream.end();

    //---------------------------------------
    // generate ansible file and ansible playbook invocation script

    // I.E.:
    // [edge]
    // n01 ansible_host=10.119.131.11 ansible_user=opapiadmin ansible_ssh_private_key_file=~/.ssh/id_ansible
    var ansibleHosts = [ "[edge]" ];

    var ansibleHostT = fp.template( '<%= id %> ansible_host=<%= ip %><%= ansible_user %><%= ansible_key %>' );


    fp.reduce( (list, node) => {
        //console.log(node);
        list.push( ansibleHostT({
            id: genNodeId( node.dcid, node.id), 
            ip: node.ip,
            ansible_user: ((program.ansible_user || "") === "") ? "" : " ansible_user="+program.ansible_user,
            ansible_key: ((program.ansible_key || "") === "") ? "" : " ansible_ssh_private_key_file="+program.ansible_key
        }) );
        return list;
    }, ansibleHosts)(fp.sortBy(["dcid","id"])(nodes));   

    var svgstream = fs.createWriteStream( program.directory + '/' + "hosts" );
    svgstream.write( ansibleHosts.join('\n') );
    svgstream.end();
    //-------------------------------------------------------------------------- 

    //---------------------------------------
    // generate ssh config file 

    // TODO: Refactor to re-use with ansibleHosts: practically same code

    // I.E.:
    // Host n02
    //     HostName 10.119.132.11
    //     IdentityFile ~/.ssh/id_ansible
    var sshConfig = [];

    var sshConfigT = fp.template( "Host <%= id %>\n" +
                                  "    HostName <%= ip %>\n" +
                                  "    IdentityFile <%= ansible_key %>\n" );


    fp.reduce( (list, node) => {
        //console.log(node);
        list.push( sshConfigT({
            id: genNodeId( node.dcid, node.id), 
            ip: node.ip,
            ansible_key: ((program.ansible_key || "") === "") ? "" : program.ansible_key
        }) );
        return list;
    }, sshConfig)(fp.sortBy(["dcid","id"])(nodes));   

    var svgstream = fs.createWriteStream( program.directory + '/' + "config" );
    svgstream.write( sshConfig.join('\n') );
    svgstream.end();
    //-------------------------------------------------------------------------- 




    //-------------------------------------------------------------------------- 

    // TODO: 
    // silent .cfg file generation
/*
ZK can either be Voter [ZKv] or Observer [ZKo]. 

For 1 DC: 3 ZK nodes, all Voters.
For 2 DC : 3 ZK nodes in each DC, 3 [ZKv] in DC-1 and 2 [ZKv]+1 [ZKo] in DC-2.

Total number of [ZKv] across all DC's needs to be always odd. Number of [ZKo] nodes is not important, they are all read-only replicas. 

 CS ZK the relevant portions of the silent files for each DC in DU: 

My naming convention has $IPA* for DC-1, $IPB* for DC-2. 

 

DC-1: 
ZK_HOSTS="$IPA13 $IPA14 $IPA15 $IPB13 $IPB14 $IPB15:observer" 
ZK_CLIENT_HOSTS="$IPA13 $IPA14 $IPA15"
CASS_HOSTS="$IPA13:1,1 $IPA14:1,1 $IPA15:1,1 $IPB13:2,1 $IPB14:2,1 $IPB15:2,1"


DC-2: 
ZK_HOSTS="$IPB13 $IPB14 $IPB15:observer $IPA13 $IPA14 $IPA15" 
ZK_CLIENT_HOSTS="$IPB13 $IPB14 $IPB15"
CASS_HOSTS="$IPB13:2,1 $IPB14:2,1 $IPB15:2,1 $IPA13:1,1 $IPA14:1,1 $IPA15:1,1"

 C* syntax is IP:DC-number,Rack-number. 

NB first character is : second is , 

$IPB15:2,3   this would be the C* node in DC2 placed on the third rack of the DC.
*/

    // Generate .cfg per dc

 // collect nodes with CS comp in all DCs
    // var css = fp.filter(
    //     ["subnets"  tier", "dmz"] 
    //     // {subnets: {"tier":"dmz"} }
    //       //  { subnets: [ { nodes: [ "components", "R" ]}]}
    // )(topology.regions);
   //     )(topology.regions[0].subnets);
//  var cs1 = fp.map( ({id, components}) => {
//     console.log(id, components);
//  } )(topology.regions);

    var genCfgFileName = function( planet, regionId, nodeId, compType, isPrimaryMS ){
        var cfgT = fp.template( "<%= planet %>-dc<%= dcid %>-<%= nodeidref %>-<%= compprefix %>.cfg" );

        // Define config file prefix
        var nodeidref = "all";
        var comp = compType.toLowerCase();
        if( compType === "MS" && isPrimaryMS ){

        }else if( compConfigurationsIdx[compType] === undefined ){
            comp = "ms";
        }else{
            nodeidref = 'n'+('0'+nodeId).slice(-2);
        }

        return cfgT({planet: planet.toLowerCase(), dcid: regionId, nodeidref: nodeidref, compprefix: comp })
    }

    var all = gatherComp(topology, "*");

    var mss = gatherComp(topology, "MS");

    var ols = gatherComp(topology, "OL");

    var uis = gatherComp(topology, "UI");
    
    // TODO: PG, PGm, PGs
    // Then add: ,{compType:"PG", comps:pgs}
    // TODO: Refactor eventually to PG with master: property
    var pss = gatherComp(topology, "PS");
    var pgms = gatherComp(topology, "PGm");
    var pgss = gatherComp(topology, "PGs");
    
    var css = gatherComp(topology, "CS");
    var zks = gatherComp(topology, "CS");
    
    var bss = gatherComp(topology, "BL");


    /* --------------------------------------------------------
        WIP
        
        Gathering of component combinations

    -------------------------------------------------------- */


    // (1) collect component combinations
    // step 1: populate compPlanet with comp info
    var compPlanet = {};
    fp.map( region => {
        fp.map( subnet => {
            fp.reduce( (compPlanet, node ) => {
                // console.log(node.components);
                compPlanet[ `/dc/${node.dcid}/n/${node.id}` ] = {
                        components: fp.map('comp')(node.components),
                        node: { 
                            dcid: node.dcid,
                            nid: node.id,
                        }
                    };
                return compPlanet;
            }, compPlanet )(subnet.nodes);
        })(region.subnets)
    })(topology.regions);

    // step 2: check if a collection of components is on a node then exclude it from compPlanet 
    var compConfList =[];
    fp.map( compConf => {
        fp.reduce( (complist, key ) => {
            if( fp.difference(compConf[1].comps,compPlanet[key].components).length === 0 ){
                compPlanet[key].components = fp.difference(compPlanet[key].components, compConf[1].comps);

                complist.push( { 
                                compType: compConf[0], 
                                node: compPlanet[key].node
                               } );
                var x = 0;   
            }
            return complist
        }, compConfList )(fp.keys(compPlanet))
    } )(compConfigurations);


    // and 
    // step 3: pivot nodes by compType; collect comps using gatherComp()
    var configLayout = {};
    fp.reduce( (configL, compConf)=>{
        
        (configL[compConf.compType]|| (configL[compConf.compType]=[])).push(compConf.node);

        return configL;
    }, configLayout )(compConfList);


    // and
    // step 4: collect comps by type
    // .comps are in format: [ { dcid: 1, nid: 2 }, {}... ]
    var configCompNodesByType = fp.map( 
        comparr => {
            return { 
                compType: comparr[0], 
                compNodes: gatherComp( topology, "nodes", comparr[1] ) }
        }
    )(fp.toPairs(configLayout))

    //
    //
    // Edge Components Integrity and Best Practices Rules
    //
    //


    // MS
    // iRULE: If there are MS nodes defined in a region, one of them should be nominated as .primary
    var noOfMSs = mss.length;
    fp( mss ).filter()
    fp.map( dc => {
            var msPrimaryCounts = fp(mss).filter(
                    {dcid: dc.id}
                ).map( n => { 
                    return {nodeid: n.nodeid, primary: n.components["MS"].primary } 
                } ).countBy({primary: true}).value();


            if( msPrimaryCounts.true != 1 ){
                ruleWarning( `Rule: each DC with MSs should have 1 .primary==true MS. Found dc: ${dc.id} has ${msPrimaryCounts.true} MSs` )
            }

        }
    )(topology.regions)
    
    // PS -- PGm, PGs
    // each PS should have its PGm/PGs counterpart on its node
    // TODO: let's evolve the language!! DSL to describe topology integrity rules


    // iRULE: single PGm across all Data centers
    var noOfPGms = pgms.length;
    if( noOfPGms !== 1 ){
        ruleWarning( `Rule: single PGm across Data Centers. Found ${noOfPGms}` )
    }


    // iRULE: Each node must have unique IP address

    var dupIPs = fp(all).groupBy("ip").pickBy(x => x.length > 1).value()
    if( !fp.isEmpty(dupIPs) ){
        ruleWarning(
            "Rule: Duplicate IP addresses assigned: "
            +
            fp.toPairs(dupIPs).map(v=> {return v[0] + ":" + v[1].map(n=>n.ipref).join(",")} ).join("; ")
        )
    }


    // iRULE: Each PS should have a single PGm or PGs on the same node
    ruleWarning( 
        fp.reduce(
            ( rerrors, ps ) => {
                if( (ps.components.PGm === undefined? 0 : 1) + (ps.components.PGs === undefined? 0 : 1) !== 1 ) {
                    rerrors.push( `Rule: Each node containing PS component must have either PGm or PGs.` );
                }
                return rerrors;
            }, []
        )(pss) 
    );


    // TODO: add an option for a type of artifact to be generated
    if( true ){
        // top-level iteration by region/DC
        fp.map( region => {

            // next-level iteration by list of nodes for a component type
            fp.map( configurations => {
                fp.map( compnode => {

                    // TODO: Refactor .primary marker with relation to the generated file name.
                    // original value : compnode.components[configurations.compType].primary ) 
                    var cfgstream = fs.createWriteStream( program.directory + '/' + genCfgFileName( topology.planet, region.id, compnode.nodeid, configurations.compType, false ) );

                    cfgstream.write( versionT({ comment: '#', planet: topology.planet, version: topology.version, genat: new Date() } ));
                    cfgstream.write("\n\n");


                    // list nodes
                    if( fp.includes("hosts")(compConfigurationsIdx[configurations.compType].config) ){
                        fp.toPairs(fp.groupBy("dcid")(all)).map(
                            dc => {
                                cfgstream.write( "#--------------------------------------------------------------------------\n");
                                cfgstream.write( "# Datacentre: " + dc[0] + "\n" );
                                cfgstream.write( "#--------------------------------------------------------------------------\n");
                                cfgstream.write(dc[1].map(n=>n.nodeipref).join('\n'));
                                cfgstream.write("\n\n");
                        })
                        cfgstream.write("");

                        cfgstream.write("HOSTIP=$(hostname -i)\n");
                    }

                    // BRAND: generated if present
                    if( fp.includes("brand")(compConfigurationsIdx[configurations.compType].config) ){
                        streamProperty( cfgstream, "BRAND", getTopologyProperty("customer.brand"), "O" );
                    }


                    // MS section:
                    /*
                    -- if more than one MS in a datacentre, 
                        seek for a primary, 
                        if absent, use first found for ALL, 
                        use <current> for each other -ms-
                    */

                    /*
                        
                    -- if MS override present, use override
                        xx
                    -- if MS and OL on the same node, pair them

                    */
                    if( fp.includes("ms-host")(compConfigurationsIdx[configurations.compType].config) ){

                        var msip = null;
                        if( compnode.components["MS"].primary ){
                            msip = compnode.ip;
                        }else{
                            // for this dc, locate MS with .primary=true and use its ipref for MSIP
                            msip = fp( mss ).filter({dcid: region.id}).map(
                                n=> { return {ip: n.ip, primary: n.components["MS"].primary }} 
                            ).filter({primary: true}).value()[0].ip 
                        }
                        streamProperty( cfgstream, "MSIP", msip );
                        streamProperty( cfgstream, "APIGEE_PORT_HTTP_MS", getTopologyProperty("customer.msPort"), "O" );
                    }

                    if( fp.includes("ms-creds")(compConfigurationsIdx[configurations.compType].config) ){
                        cfgstream.write( `ADMIN_EMAIL=${getTopologyProperty("customer.adminEmail")}\n` );
                        cfgstream.write( `APIGEE_ADMINPW=${getTopologyProperty("customer.adminPassword")}\n` );
                    }
                
                    if( fp.includes("license")(compConfigurationsIdx[configurations.compType].config) ){
                        streamProperty( cfgstream, "LICENSE_FILE", getTopologyProperty("customer.licenseFile") );
                    }

                    if( fp.includes("bind")(compConfigurationsIdx[configurations.compType].config) ){
                        streamProperty( cfgstream, "BIND_ON_ALL_INTERFACES", getTopologyProperty("customer.bindOnAllInterfaces"), "O" );
                    }

                    if( fp.includes("run-as")(compConfigurationsIdx[configurations.compType].config) ){
                        streamProperty( cfgstream, "RUN_GROUP", getTopologyProperty("customer.runGroup"), "O" );
                        streamProperty( cfgstream, "RUN_GROUP", getTopologyProperty("customer.runGroup"), "O" );
                    }

                    // MP_POD: generated if present
                    if( fp.includes("rmp-pod")(compConfigurationsIdx[configurations.compType].config) ){
                        streamProperty( cfgstream, "MP_POD", getTopologyProperty("customer.mpPod"), "O" );
                    }

                    // REGION
                    if( fp.includes("region")(compConfigurationsIdx[configurations.compType].config) ){
                        streamProperty( cfgstream, "REGION", region.name, "O" );
                    }



                    // TODO: LDAP

            /*------------------------
            LDAP properties affected are:

            USE_LDAP_REMOTE_HOST=y
            LDAP_HOST=
            APIGEE_LDAPPW=
            LDAP_PORT=
            for multi DC: LDAP_TYPE=2; if standalone, i..e no replication needed: LDAP_TYPE=1

            LDAP_SID=1,2,3 etc for the ID of each node in sequence
            LDAP_PEER=

            for up to 2 LDAP nodes LDAP_PEER point to each other. For more I have the logic. Limit to 2 LDAP peers for now in your logic

            for total  >2 nodes is LDAP multimaster replication across 3 or more nodes.

            */

            // TODO: break it down to cs* zk* sections
                if( fp.includes("cassandra")(compConfigurationsIdx[configurations.compType].config) ){
                    // TODO:  change the behavior of observer so that if some ZK nodes are marked as observer in the topology, then this choice marking is respected.
                    cfgstream.write( "\n" );

                    var observers = (zks.length % 2)===0 ? 1: 0

                    var _zks = fp(zks).take(zks.length-observers).map(n=> ({dcid: n.dcid, zkref: "$"+n.ipref}) ).value().concat(
                                    fp(zks).takeRight(observers).map(n=> ({ dcid: n.dcid, zkref: "$"+n.ipref + ":observer" }) ).value()
                                );

                    var ZK_HOSTS = fp(_zks).map(n=>n.zkref).value().join(" ");


                    var ZK_CLIENT_HOSTS = fp(zks).filter({dcid: region.id}).map(n=> "$"+n.ipref).value().join(" ") 

                    var CASS_HOSTS = fp(css).filter({dcid: region.id}).map(n=>n.drref).value().join(" ") 
                                + " " + fp(css).reject({dcid: region.id}).map(n=>n.drref).value().join(" ");

                    streamProperty( cfgstream, "ZK_HOSTS", "\""+ZK_HOSTS+"\"", "R" );
                    streamProperty( cfgstream, "ZK_CLIENT_HOSTS", "\""+ZK_CLIENT_HOSTS+"\"", "R" );
                    streamProperty( cfgstream, "CASS_HOSTS", "\""+CASS_HOSTS+"\"", "R" );
                    
                }

                if( fp.includes("ldap-host")(compConfigurationsIdx[configurations.compType].config) ){
                    cfgstream.write( "\n" );

// TODO: MSIP for MS section also LDAP_REMOTE_HOST=y if it is not collocated with an MS 
// TODO: MS

                    // TODO: check USE_LDAP_REMOTE_HOST

                    if( configurations.compType == "MS"){
                        if( typeof compnode.components["MS"].ldapHost == "undefined" ){
                            // OL is collocated with MS
                            cfgstream.write( `USE_LDAP_REMOTE_HOST=n\n` );

                        }else{
                            // OL is remote
                            cfgstream.write( `USE_LDAP_REMOTE_HOST=y\n` );

                            // Deref OL for MS
                            var ldapNode = getNodeByIpRef( all, compnode.components["MS"].ldapHost );

                            cfgstream.write( `LDAP_HOST=${ldapNode.ipref}\n` );
                            cfgstream.write( `LDAP_TYPE=${ldapNode.components["OL"].ldapType}\n` );
                            cfgstream.write( `LDAP_SID=${ldapNode.components["OL"].ldapSid}\n` );
                        }
                    }
                }
                
                if( fp.includes("ldap-conf")(compConfigurationsIdx[configurations.compType].config) ){
                    cfgstream.write( "\n" );

                    cfgstream.write( `LDAP_TYPE=${compnode.components["OL"].ldapType}\n` );
                    cfgstream.write( `LDAP_SID=${compnode.components["OL"].ldapSid}\n` );
                    if( typeof compnode.components["OL"].ldapPeer !== "undefined" ){
                        cfgstream.write( `LDAP_PEER=$${
                            ipT( fp.zipObject( [ "regexpmatch", "dcid", "nodeid" ] )
                            ( /\/dc\/(\d+)\/n\/(\d+)/.exec( compnode.components["OL"].ldapPeer ) )
                            )
                        }\n` );
                    }
                }

                if( fp.includes("ldap-creds")(compConfigurationsIdx[configurations.compType].config) ){
// TODO: add other creds parameters

                    streamProperty( cfgstream, "APIGEE_LDAPPW", getTopologyProperty("customer.ldapPassword"), "R" );
                }                


                //-------------------
                        // TODO: PG/PGm/PGs
                if( fp.includes("pg-conf")(compConfigurationsIdx[configurations.compType].config) ){
                    cfgstream.write( "\n" );

                    // PGm - a single master across Data Centres; checked by iRules;
                    // PGs - either a current one or any, ie, a first from PGs collection

                    if( typeof compnode.components["PG"] !== 'undefined' ){

                        // skip section generation 
                    }else{
                        var pgmnodeipref = (typeof compnode.components["PGm"] === 'undefined' ? pgms[0].ipref : compnode.ipref ); 
                        var pgsnodeipref = (typeof compnode.components["PGs"] === 'undefined' ? pgss[0].ipref : compnode.ipref ); 

                        streamProperty( cfgstream, "PG_MASTER", "$"+ pgmnodeipref );
                        streamProperty( cfgstream, "PG_STANDBY", "$" + pgsnodeipref );
                    }
                }
                        
                if( fp.includes("pg-creds")(compConfigurationsIdx[configurations.compType].config) ){
                    cfgstream.write( "\n" );
                    streamProperty( cfgstream, "PG_USER", getTopologyProperty("customer.pgUsername"), "R" );
                    streamProperty( cfgstream, "PG_PWD", getTopologyProperty("customer.pgPassword"), "R" );
                }

                if( fp.includes("smtp")(compConfigurationsIdx[configurations.compType].config) ){
                    cfgstream.write( "\n" );
                    streamProperty( cfgstream, "SKIP_SMTP", getTopologyProperty("customer.skipSmtp"), "R" );
                    streamProperty( cfgstream, "SMTPHOST", getTopologyProperty("customer.smtpHostp"), "O" );
                    streamProperty( cfgstream, "SMTPPORT", getTopologyProperty("customer.smtpPort"), "O" );
                    streamProperty( cfgstream, "SMTPUSER", getTopologyProperty("customer.smtpUser"), "O" );
                    streamProperty( cfgstream, "SMTPPASSWORD", getTopologyProperty("customer.smtpPassword"), "O" );
                    streamProperty( cfgstream, "SMTPMAILFROM", getTopologyProperty("customer.smtpMailFrom"), "R" );
                    streamProperty( cfgstream, "SMTPSSL", getTopologyProperty("customer.smtpSsl"), "O" );
                }
                
                cfgstream.end();
                    
                })(configurations.compNodes)
            })(configCompNodesByType)
        })(topology.regions)
    }
    // end: program.prefix




    //-------------------------------------------------------------------------- 
    //
    // TODO:
    // ansible top-level script
    // TODO: add as an optional 
    //
    //-------------------------------------------------------------------------- 


    //
    // ansible script using raw components: DEPRECATE AFTER REFACTOR of coarse-grained install sequence
    //
/*
    if( true ){
        var ansiblestream = fs.createWriteStream( program.directory + '/' + "ansible-install-finegrained.sh" );

        var ansibleT = fp.template( 'ansible-playbook -l <%= regionidnodeidref %> $OPS_HOME/<%= comp.ansible %> -e "COMP=<%= comp.comp %> CFG=configs/<%= cfg %>"' );

        fp.map( region => {

            fp.map( comp =>
                ansiblestream.write(
                    fp.map(
                        compnode => ansibleT({ 
                            regionidnodeidref: compnode.regionidnodeidref, 
                            comp: compInst[ comp ], 
                            cfg: genCfgFileName( topology.planet, region.id, compnode.nodeid, comp, comp==="MS"?compnode.components[comp].primary:false ) })
                    )( fp.filter({dcid: region.id} )(gatherComp(topology, comp )) ).join('\n') +
                    "\n\n"
                )
            )(portdefs.edgecomponentinstallsequence)
        })(topology.regions);

        ansiblestream.end();
        //-------------------------------------------------------------------------- 
    }
*/

    if( true ){
        var ansiblestream = fs.createWriteStream( program.directory + '/' + "ansible-install.sh" );

        var ansibleT = fp.template( 'ansible-playbook -l <%= regionidnodeidref %> $OPS_HOME/<%= comp.ansible %> -e "COMP=<%= comp.comp %> CFG=configs/<%= cfg %>"' );

        // Use configCompNodesByType
        //  type:
        //     dcid
        //     
        fp.map( dcid => {

            fp.map( comp =>
                ansiblestream.write(
                    fp.map(
                        compnode => ansibleT({ 
                            regionidnodeidref: genNodeId( dcid, compnode.nid ), 
                            comp: compConfigurationsIdx[ comp ], 
                                    // TODO: do we really need: comp==="MS"?compnode.components[comp].primary:false 
                                    // as a 3rd parameter? me think not if yes remove after refactoring 
                            cfg: genCfgFileName( topology.planet, dcid, compnode.nid, comp, false ) })
                    )( fp.filter( {dcid: dcid} )( configLayout[comp] ) ).join('\n') +
                    "\n\n"
                )
            )(portdefs.edgecomponentinstallsequence)
        })(fp.map(region=> region.id)(topology.regions));

        ansiblestream.end();
        //-------------------------------------------------------------------------- 
    }



    // TODO: WIP: generate start/stop sequence
    //
    //if( program.ansible_script ){


        // TODO: add support of BRAND=apigee|sap
        // TODO: add DP and as a resulp, versions (DP is only 17.01+)

        //var ansibleT = fp.template( 'ansible-playbook -l <%= regionidnodeidref %> $OPS_HOME/edge-comp-setup.yml -e "COMP=<%= comp %> CFG=<%= cfg %>"' );
        var prologT = fp.template(`#!/bin/bash
# check mandatory options

help(){
        echo ""
        echo "planetcontrol.sh <target> <action> [dryrun]"
        echo ""
        echo "Arguments:"
        echo ""
        echo " <target>: planet or dc-1 or dc-2"
        echo " <action>: start or stop"
        echo ""
        echo " <dryrun>: optional, if present the output command will be produced but not executed"
        echo ""
}

if [ "$#" -lt 2 ]
then
        echo "Wrong number of mandatory arguments supplied."
        echo.
    help
    exit 1
fi


TARGET=$1
ACTION=$2
DRYRUN=$3

if [[ ! ";dc-1;dc-2;planet;" =~ ";$TARGET;" ]]
then
   echo "Unsupported target: $TARGET"
   help
   exit 1
fi


if [[ ! ";start;stop;" =~ ";$ACTION;" ]]
then
   echo "Unsupported Action: $ACTION"
   help
   exit 1
fi

if [[ ! "$DRYRUN" == "" ]]
then
    DRYRUN="echo "
    DRYESC="\"
    DRYQUOTE='"'
fi

`);


// TODO: prolog is currently hacker. REFACTOR!!! 
// TODO:
// TODO: escape dollar, remove space

        var compControlT = fp.template( `
if [[ ";<%= regionref %>;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible <%= regionidnodeidref %> -a $DRYESC$DRYQUOTE"apigee-service <%= comp %> $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi

` );
        genSequence(topology, portdefs.edgecomponentstartsequence, compControlT, prologT, program.directory + '/' + "planetcontrol.sh")
    //}
};



function genSequence(topology, sequence, template, prologtemplate, file){
    //-------------------------------------------------------------------------- 
    // TODO:
    // ansible top-level script

        var ansiblestream = fs.createWriteStream( file );

        ansiblestream.write( prologtemplate() );

        fp.map( compType =>

            fp.map( region => {
    
                ansiblestream.write(
                    fp.map(
                        n => template({ regionref: region.name, regionidnodeidref: n.regionidnodeidref, comp: compName[ compType ] })
                    )( fp.filter({dcid: region.id} )(gatherComp(topology, compType )) ).join('\n') +
                    "\n\n"
                )
            })(topology.regions)
        )(sequence);

        ansiblestream.end();
        //-------------------------------------------------------------------------- 
}