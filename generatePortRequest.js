var fp = require("lodash/fp");


module.exports = function ( topologyFile, outputFile ){

    var portdefs = require("./edge-port-defs.json");

    //var topology = require("./uat-12n-4sn-topology.json");
    var topology = require( topologyFile );


    // Edge External Clients: Incoming

    // Edge External Clients: Outgoing

    // TODO: in topology, "externalclients" section contant client component ID with "source" property override 
    //       that supposed to be overlayed as an easy implementation


    // TODO: PGM, PGS, "OL"

    // MultiDC comments; applied to: edge-port-defs.json multidc section

        //  http://docs.apigee.com/private-cloud/latest/installation-requirements
        //  MP --> MP(4528)
        //  MS --> R(1100,4527), MP (4528,1101) PGother(5432)
        //  MS, CS  --> CS(7000,7199,9160)
        //  ZK --> ZK: 2181, 2888,3888
        //  OL --> OL(10389)
        //  QIS --> PGother 5432
        //  PGm --> PGs 5432
        //  
        //  Target Backends:
        // 


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
    var nodes = fp.fromPairs( 
        fp.flatMap( region => 
            fp.flatMap( subnet => 
                fp.map( node => 
                    [ region.id + '-' + node.id, node ] 
                )(subnet.nodes) 
            )(region.subnets)
        )(topology.regions)
    );

    // ports reference collection for port type, description
    var ports = fp.keyBy("id")(portdefs.ports);


    fp.map( region => 
        fp.forEach( 
            o => nodes[ region.id+'-'+o.id] = o )( fp.keyBy( "id" )( fp.flatMap( subnet => subnet.nodes  
        )( portdefs.externalclientspseudosubnets ) ) )
    )(topology.regions);

    // overlay subnets [TODO: what else?]

    // edge subnets for a single DC 
    function overlayRegion(dc){
        var region = fp.cloneDeep( fp.find({'id':dc})(topology.regions) );

        region.subnets = region.subnets.concat( portdefs.externalclientspseudosubnets);

        return region;
    } 

    // 
    // Processing Regions Collection
    // 
    //  for a same dc brach: 
    //      it is a single dc situation: 
    //          use subnets within dc
    //  for different dc branches
    //      it is a multi-dc situation:
    //          a) collate left and right dcs into two subnets 
    //             by filtering just needed client components
    //          b) pretend it is a 2 subnet single dc

    var firewallPortRequestsList = [];
    fp.map( ldc => 
        fp.map( rdc => {
            console.log(ldc+":"+rdc);
            firewallPortRequestsList = firewallPortRequestsList.concat( genFirewallPortRequestsList( overlayRegion(ldc), overlayRegion(rdc), portdefs, nodes, ports ) );
        })(fp.map('id')(topology.regions))
    )(fp.map('id')(topology.regions));



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

    var columns = [ "category", "srcnode", "srchostname", "srcip", "dstnode", "dsthostname", "dstip", "clientcomponent", "servercomponent", "port", "description" ];

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

//
// returns list of firewall ports
//
// clientregion.id === serverregion.id generates ports for single-dc topology
// clientregion.id === serverregion.id generates multi-dc ports

function genFirewallPortRequestsList( clientregion, serverregion, portdefs, nodes, ports  ){

    var mapping = clientregion.id === serverregion.id ? "edge" : "multidc";

    // top-level map by client.component
    var firewallPortRequests = [];
    var firewallPortRequest = fp.map(category =>
        fp.map( clientComponent => {

            var clientsubnets = fp.flatMap( subnet => 
                                    fp.filter( 
                                        node => fp(node.components).includes(clientComponent) 
                                    )(subnet.nodes).map(n=>{ return {node: n.id, subnet: subnet.name}; } )  
                                )(clientregion.subnets);

            // next-level map by server.component
            var servercomponents = fp.filter( 'component' )((fp.find(['client.component', clientComponent])(portdefs.mappings[category.mapping])).client.servers);
            
            fp.map( sc =>{
                var serversubnets = fp.flatMap( subnet => 
                                        fp.filter( 
                                            node => fp(node.components).includes(sc.component) 
                                        )(subnet.nodes).map(n=>{ return {node: n.id, subnet: subnet.name}; } )  
                                    )(serverregion.subnets);
                    
                // console.log(servernodes)


                // bottom-level reduce by subnet analysis
                var n = fp.flatMap( cs => 
                    fp.reduce( (plist, ss ) => {
                            ss.subnet == cs.subnet ? plist : plist.push( 
                                // flatMap by sc.ports
                                // { src: cs.node, dst: ss.node, port: sc.ports }
                                fp.map( port => { 
                                    return { 
                                        category: category.name, 
                                        srcnode: cs.node, 
                                        srchostname: nodes[ clientregion.id+'-'+cs.node ].hostname,  
                                        srcip: nodes[ clientregion.id+'-'+cs.node ].ip, 
                                        dstnode: ss.node, 
                                        dsthostname: nodes[  serverregion.id+'-'+ss.node ].hostname, 
                                        dstip: nodes[ serverregion.id+'-'+ss.node ].ip, 
                                        clientcomponent: clientComponent, 
                                        servercomponent: sc.component, 
                                        port: port, 
                                        description: (ports[port] ? ports[port].description : "")
                                    }; 
                                } )(sc.ports)
                            );
                            return plist;
                        }, firewallPortRequests )(serversubnets) 
                )(clientsubnets)

            })(servercomponents);
            
        })(category.clients)
    )(fp.filter( { 'mapping': mapping} )(portdefs.categories));

    return fp.flattenDeep(firewallPortRequests);    
}

