var fp = require("lodash/fp");



module.exports = function ( topologyFile, outputFile, program ){

    var portdefs = require("./edge-port-defs.json");

    var topology = require( topologyFile );



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
                    node.roles = node.components;

                    node.dcid = region.id;

                    node.subnet = subnet.name;

                    return node;
                } )(subnet.nodes) 
            )(region.subnets)
        )(topology.regions);

    // Templates
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
            color: red
        }
        .role3rdParty {
            font-weight: bold;
            color: blue
        }
        .nodeID {
            font-weight: bold;
        }
    </style>
</head>`;

    var htmlInventoryHeader = `<table>\n
<thead>
    <tr>
        <th>Node #</th>
        <th>Role(s)</th>
        <th>DC</th>
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
    <td>Node <bold><%= id %></bold></td>
    <td><%= roles %></td>
    <td>dc-<%= dcid %></td>
    <%= rackcell %>
    <td><%= subnet %></td>
    <td><%= hostname %></td>
    <td><%= ip %></td>
</tr>`);

    // http://htmlcolorcodes.com/assets/downloads/flat-design-colors/flat-design-color-chart.png
    var rackLabel = {
        1: "#f2d7d5",
        1: "#ebdef0",
        2: "#dfe6f1",
        3: "#d1f2eb",
        4: "#fcf3cf",
        5: "#fdebd0",
        6: "#fae5d3",
        7: "#f6ddcc"
    }

    // Generate html table
    var htmlInventoryNodes = [];

    fp.reduce( (list, node) => {
        //console.log(node);
        list.push( htmlTDTemplate({
            id: '<span class="nodeID">'+node.id+'</span>', 
            roles: fp.map( role => isApigee[role]?'<span class="roleApigee">'+role+'</span>':'<span class="role3rdParty">'+role+'</span>' )(node.roles).join(','), 
            dcid: node.dcid, 
            rackcell: typeof node.rack === "undefined" ? '<td/>' : '<td style="text-align:right; background-color:'+rackLabel[node.rack]+';">'+node.rack+'</td>', 
            subnet: node.subnet,
            hostname: node.hostname, 
            ip: node.ip}) );
        return list;
    }, htmlInventoryNodes)(fp.sortBy(["dcid","id"])(nodes));
    
    //



    //---------------------------------------
    fs = require('fs');
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

    var ansibleHostTemplate = fp.template( '<%= id %> ansible_host=<%= ip %><%= ansible_user %><%= ansible_key %>' );

    // function genRegionIdNodeId( onlySingleDC,  dcid, nodeid ){
    //     return onlySingleDC ? "n"+ fp.padCharsStart('0')(2)(nodeid) : "dc" + dcid + "n"+ fp.padCharsStart('0')(2)(nodeid);
    // }
    var genRegionIdNodeId = fp.curry( (onlySingleDC,  dcid, nodeid ) => {
        return onlySingleDC ? "n"+ fp.padCharsStart('0')(2)(nodeid) : "dc" + dcid + "n"+ fp.padCharsStart('0')(2)(nodeid);
    })
    var genNodeId = genRegionIdNodeId( topology.regions.length === 1 );

    fp.reduce( (list, node) => {
        //console.log(node);
        list.push( ansibleHostTemplate({
            id: genNodeId( node.dcid, node.id), 
            ip: node.ip,
            ansible_user: ((program.ansible_user || "") === "") ? "" : " ansible_user="+program.ansible_host,
            ansible_key: ((program.ansible_key || "") === "") ? "" : " ansible_ssh_private_key_file="+program.ansible_key
        }) );
        return list;
    }, ansibleHosts)(fp.sortBy(["dcid","id"])(nodes));   

    //--------------------------- 
    fs = require('fs');
    var svgstream = fs.createWriteStream( "hosts" );
    svgstream.write( ansibleHosts.join('\n') );
    svgstream.end();

    // TODO:
    // ansible top-level script

    //var edgeComponentInstallOrder = [ "ZK", "CS", "OL", "MS", "MP", "R", "PS", "QS" ];


};

