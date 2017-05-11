var fp = require("lodash/fp");


module.exports = function ( topologyFile, outputFile ){

    var portDefs = require("./edge-port-defs.json");

    //var topology = require("./uat-12n-4sn-topology.json");
    var topology = require( topologyFile );


    // Edge External Clients: Incoming
    var edge_ext_inc = [ "UICLNT", "MSCLNT", "VHOST", "HBCLNT", "SMTP", "JMX", "IFCLNT", "GFCLNT" ];

    // Edge External Clients: Outgoing
    var edge_ext_outg = [ "TE", "SMTP" ];

    // TODO: in topology, "externalclients" section contant client component ID with "source" property override 
    //       that supposed to be overlayed as an easy implementation


    // TODO: PGM, PGS, "OL"
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


    // nodes reference collection for hostname, ip lookups
    // overlay nodes
    var nodes = fp.keyBy( "id" )( fp.flatMap( subnet => subnet.nodes  )(topology.regions[0].subnets) );

    fp.forEach( 
        o => nodes[o.id] = o )( fp.keyBy( "id" )( fp.flatMap( subnet => subnet.nodes  
    )( portDefs.externalclientspseudosubnets ) ) );

    var firewallPortRequests = [];

    // overlay subnets [TODO: what else?]
    var subnets = [];
    subnets = subnets.concat( topology.regions[0].subnets );
    subnets = subnets.concat( portDefs.externalclientspseudosubnets);

    // top-level map by client.component
    var firewallPortRequest = fp.map(category =>
        fp.map( clientComponent => {

            var clientsubnets = fp.flatMap( subnet => 
                                    fp.filter( 
                                        node => fp(node.components).includes(clientComponent) 
                                    )(subnet.nodes).map(n=>{ return {node: n.id, subnet: subnet.name}; } )  
                                )(subnets);

            // next-level map by server.component
            var servercomponents = fp.filter( 'component' )((fp.filter(['client.component', clientComponent])(portDefs.edge))[0].client.servers)
            
            fp.map( sc =>{
                var serversubnets = fp.flatMap( subnet => 
                                        fp.filter( 
                                            node => fp(node.components).includes(sc.component) 
                                        )(subnet.nodes).map(n=>{ return {node: n.id, subnet: subnet.name}; } )  
                                    )(subnets);
                    
                // console.log(servernodes)


                // bottom-level reduce by subnet analysis
                var n = fp.flatMap( cs => 
                    fp.reduce( (plist, ss ) => {
                            ss.subnet == cs.subnet ? plist : plist.push( 
                                // flatMap by sc.ports
                                // { src: cs.node, dst: ss.node, port: sc.ports }
                                fp.map( port => { return { category: category.name, srcnode: cs.node, srchostname: nodes[cs.node].hostname,  srcip: nodes[cs.node].ip, dstnode: ss.node, dsthostname: nodes[ss.node].hostname, dstip: nodes[ss.node].ip, clientcomponent: clientComponent, servercomponent: sc.component, port: port }; } )(sc.ports)
                            );
                            return plist;
                        }, firewallPortRequests )(serversubnets) 
                )(clientsubnets)

            })(servercomponents);
            
        })(category.clients)
    )(portDefs.categories);

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

    var columns = [ "category", "srcnode", "srchostname", "srcip", "dstnode", "dsthostname", "dstip", "clientcomponent", "servercomponent", "port" ];

    // redundant records
    var csv = [ fp.chain( firewallPortRequestsList[0] ).pick(columns).keys().value().join( ", ") ];

    fp.forEach( portRecord => 
        csv.push( fp.chain( portRecord ).pick(columns).values().value().join( ", ") )
    )(firewallPortRequestsList);


    // compact records
    var firewallPortCompactList = fp.flow(
        fp.groupBy(r=> r.srcip+"|"+r.dstip+"|"+r.port ),
        fp.map(groups=>({v:groups[0].srcip, d:groups[0].dstip,
            cc: fp.compose(
                 fp.join(';'),   fp.uniq,fp.map('clientcomponent')
                )(groups),
            ss: fp.compose(
                fp.join(';'),fp.uniq,fp.map('servercomponent')
            )(groups)
        }))
    )(firewallPortRequestsList)

    var csvCompact = [];
    fp.forEach( portRecord => 
        csvCompact.push( portRecord.v + "," + portRecord.d + "," +  portRecord.cc + "," +  portRecord.ss )
    )(firewallPortCompactList);


    fs = require('fs');
    fs.writeFile( outputFile+".compact", csvCompact.join("\n"), function (err) {
        if (err) 
            return console.log(err);
        console.log("File successfully written out");
    });


    fs = require('fs');
    fs.writeFile( outputFile, csv.join("\n" ), function (err) {
        if (err) 
            return console.log(err);
        console.log("File successfully written out");
    });
}
