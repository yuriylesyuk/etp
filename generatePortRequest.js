var fp = require("lodash/fp");


module.exports = function ( topologyFile, outputFile ){

    var portDefs = require("./edge-port-defs.json");

    //var topology = require("./uat-12n-4sn-topology.json");
    var topology = require( topologyFile );


    // Edge Ports: iterate over
    var edge_ext = [ "UICLNT", "MSCLNT", "MPTE", "LBHB", "SMTP", "JMX" ];

    // TODO: PGM, PGS, "OL", "ZK", "CS", , "PG"
    var edge_int = [ "R", "MP", "MS", "UI", "QIS", "PG", "ZK", "CS" ];

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
            
            // console.log(servernodes)


            // bottom-level reduce by subnet analysis
            var n = fp.flatMap( cs => 
                fp.reduce( (plist, ss ) => {
                        ss.subnet == cs.subnet ? plist : plist.push( 
                            // flatMap by sc.ports
                            // { src: cs.node, dst: ss.node, port: sc.ports }
                            fp.map( port => { return { srcnode: cs.node, srchostname: nodes[cs.node].hostname,  srcip: nodes[cs.node].ip, dstnode: ss.node, dsthostname: nodes[ss.node].hostname, dstip: nodes[ss.node].ip, clientcomponent: clientComponent, servercomponent: sc.component, port: port }; } )(sc.ports)
                        );
                        return plist;
                    }, firewallPortRequests )(serversubnets) 
            )(clientsubnets)

        })(servercomponents);
        
    })(edge_int);

    var firewallPortRequestsList = fp.flattenDeep(firewallPortRequests);



    var testportcolumns = [ "c", "s", "p"]

    var testports = fp.flow(
                    fp.map( port => { return { c: port.srcip, s: port.dstip, p: port.port }; } )
        )(firewallPortRequestsList).reduce( (arr,elem) => { arr.push( elem ); return arr;}, [] ) ;

    // Generate test port input
    var testport = { ports: 
                        testports
                    };

    fs = require('fs');
    fs.writeFile('openapi-dev-ports.json', JSON.stringify(testport, null, 4), function (err) {
        if (err) 
            return console.log(err);
        console.log("File successfully written out");
    });






    // Generate CSV 
    //console.log(firewallPortRequests);

    var columns = [ "srcnode", "srchostname", "dstnode", "dsthostname", "clientcomponent", "servercomponent", "port" ];


    var csv = [ fp.chain( firewallPortRequestsList[0] ).pick(columns).keys().value().join( ", ") ];

    fp.forEach( portRecord => 
        csv.push( fp.chain( portRecord ).pick(columns).values().value().join( ", ") )
    )(firewallPortRequestsList);


    fs = require('fs');
    fs.writeFile( outputFile, csv.join("\n" ), function (err) {
        if (err) 
            return console.log(err);
        console.log("File successfully written out");
    });
}
