var fp = require("lodash/fp");



var portDefs = require("./edge-port-defs.json");

//var topology = require("./enbd-uat.topology.json");
var topology = require("./uat-19n-3sn-topology.json");


// Edge Ports: iterate over
var edge_ext = [ "UICLNT", "MSCLNT", "MPTE", "LBHB", "SMTP", "JMX" ];

// TODO: PGM, PGS, "OL", "ZK", "CS", , "PG"
var edge_int = [ "R", "MP", "MS", "UI", "QIS" ];

var edge_mon = [ "TG", "IF", "GF" ];

// Iteration rules:
// 1. R->>all MP
//    R->>R all but self

// 2. same subnet: skip 
// 3. same computer: skip (<-- included in above)

// dual numbering/addressing of multiple instance components
//   MP1:1 MP2:6   (
    // sequence of letters- comp name; 
    // immediately following digits - comp number; 
    // colon then digits - node)
// if comp number is missing -- implied is used

// iteration nestness: 
//     -- by edge_* group; 
//        -- as client by servers from port-defs
//           -- fetch collection of server comp from topology; 
//              -- use rule 1
//              -- use rule 2
//              -- put result into result collection
// 
// Result collection columns: SComp, DComp; SNode No, SNode IP, DNode No, DNode IP; Port


// use rule 1 filter comp != comp -> drop it

// filterByServer()
// use filter to return list of nodes that contain a required server component from layout
//    {"components": server }





console.log(fp(topology.layout[0].components).includes("MP"));

var clientnodes = fp.filter( n => fp(n.components).includes("R") )(topology.layout).map(n=>n.node);

var servernodes_r = fp.filter( n => fp(n.components).includes("R") )(topology.layout).map(n=>n.node);

var servernodes = fp.filter( n => fp(n.components).includes("MP") )(topology.layout).map(n=>n.node);
console.log(servernodes);

var subnet = fp.filter( s => fp(s.nodes).includes(9))(topology.subnets).map(s=>s.name) ;

var clientsubnets = fp.flatMap( n => fp.filter( s => fp(s.nodes).includes(n))(topology.subnets).map(s=>{ return { node: n, subnet: s.name }; }) )(clientnodes);

var serversubnets_r = fp.flatMap( n => fp.filter( s => fp(s.nodes).includes(n))(topology.subnets).map(s=>{ return { node: n, subnet: s.name }; }) )(servernodes_r);
var serversubnets = fp.flatMap( n => fp.filter( s => fp(s.nodes).includes(n))(topology.subnets).map(s=>{ return { node: n, subnet: s.name }; }) )(servernodes);

console.log(clientsubnets);
console.log(serversubnets);
// R=>R
var n_r = fp.flatMap( cs => 
     fp.reduce( (plist, ss ) => {
            ss.subnet == cs.subnet ? plist : plist.push( { src: cs.node, dst: ss.node, port: fp.find({'component':"R"})(portDefs.edge.client) } );
            return plist;
         },[])(serversubnets_r) 
   )(clientsubnets)
console.log("--------")
console.log(n_r);
// R=>MP
var n = fp.flatMap( cs => 
     fp.reduce( (plist, ss ) => {
            ss.subnet == cs.subnet ? plist : plist.push( { src: cs.node, dst: ss.node, port: "<ports>"} );
            return plist;
         },[])(serversubnets) 
   )(clientsubnets)

console.log(n);
//var fwrequest = fp.reduce( (l, i)=> {
//    i.
//    return l;
//}, [] )




//console.log( fp.filter(topology.layout, i => fp.includes(i.components, "MP");
//fp.includes(topology.layout)
// nested lookup:
//var cc = fp.filter({client: [{component: "R"}]})(portDefs.edge);
//var cc = fp.filter( ['client.component',"R" ] )(portDefs.edge).filter(['servers.component', "MP"]);

var cc = fp.filter(['client.component', "R"])(portDefs.edge)[0].client;
var ss = fp.filter(['component', "MP"])(cc.servers)[0];



console.log(ss.ports);

// same but one-liner

// TODO: later or maybe
var ports = fp.filter(['component', "MP"])((fp.filter(['client.component', "R"])(portDefs.edge))[0].client.servers);


var ports = fp.fi
console.log( ports);

console.log("====================================================");

var nodes = fp.keyBy( "id" )( topology.nodes );



var firewallPortRequests = [];

// top-level map by client.component
var firewallPortRequest = fp.map( clientComponent =>{
    var clientnodes = fp.filter( n => fp(n.components).includes( clientComponent ) )(topology.layout).map(n=>n.node);
    var clientsubnets = fp.flatMap( n => fp.filter( s => fp(s.nodes).includes(n))(topology.subnets).map(s=>{ return { node: n, subnet: s.name }; }) )(clientnodes);

    // next-level map by server.component
    var servercomponents = fp.filter( 'component' )((fp.filter(['client.component', clientComponent])(portDefs.edge))[0].client.servers)
    
    fp.map( sc =>{
        var servernodes = fp.filter( n => fp(n.components).includes( sc.component ) )(topology.layout).map(n=>n.node);
        var serversubnets = fp.flatMap( n => fp.filter( s => fp(s.nodes).includes(n))(topology.subnets).map(s=>{ return { node: n, subnet: s.name }; }) )(servernodes);
        
        console.log(servernodes)


        // bottom-level reduce by subnet analysis
        var n = fp.flatMap( cs => 
            fp.reduce( (plist, ss ) => {
                    ss.subnet == cs.subnet ? plist : plist.push( 
                        // flatMap by sc.ports
                        // { src: cs.node, dst: ss.node, port: sc.ports }
                        fp.map( port => { return { srcnode: cs.node, srchostname: nodes[cs.node].hostname,  dstnode: ss.node, dsthostname: nodes[ss.node].hostname, clientcomponent: clientComponent, servercomponent: sc.component, port: port }; } )(sc.ports)
                    );
                    return plist;
                }, firewallPortRequests )(serversubnets) 
        )(clientsubnets)

    })(servercomponents);
    
})(edge_int);


// Generate CSV 
//console.log(firewallPortRequests);

var columns = [ "srcnode", "srchostname", "dstnode", "dsthostname", "clientcomponent", "servercomponent", "port" ];

var firewallPortRequestsList = fp.flattenDeep(firewallPortRequests);

var csv = [ fp.chain( firewallPortRequestsList[0] ).pick(columns).keys().value().join( ", ") ];

fp.forEach( portRecord => 
    csv.push( fp.chain( portRecord ).pick(columns).values().value().join( ", ") )
)(firewallPortRequestsList);


fs = require('fs');
fs.writeFile('firewallportsrequest.csv', csv.join("\n"), function (err) {
    if (err) 
        return console.log(err);
    console.log("File successfully written out");
});


