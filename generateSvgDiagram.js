var fp = require("lodash/fp");


module.exports = function ( topologyFile, outputFile ){
    var portDefs = require("./edge-port-defs.json");

    var topology = require( topologyFile );
    //var topology = require("./uat-19n-3sn-topology.json");


    // TODO: templatize height and width of svg

    var svgHeader = `<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
xmlns:svg="http://www.w3.org/2000/svg"
xmlns="http://www.w3.org/2000/svg"
xmlns:xlink="http://www.w3.org/1999/xlink"
height="600"
width="600"
xml:space="preserve"
version="1.1"
id="svg2">

<symbol id="struct">
    <rect id="compcs2" x="1.5" y="1.5" width="23" height="16" rx="3" style="stroke-width:1.5"/>
</symbol>

<symbol id="ui">
    <use xlink:href="#struct" style="fill:#5287a2;stroke:#5287a2;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >UI</text>
</symbol>

<symbol id="ms">
    <use xlink:href="#struct" style="fill:#5287a2;stroke:#5287a2;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >MS</text>
</symbol>

<symbol id="r">
    <use xlink:href="#struct" style="fill:#5287a2;stroke:#5287a2;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >R</text>
</symbol>

<symbol id="mp">
    <use xlink:href="#struct" style="fill:#5287a2;stroke:#5287a2;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >MP</text>
</symbol>

<symbol id="cs">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#5287a2;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#5287a2;" 
        alignment-baseline="middle" text-anchor="middle"
    >CS</text>
</symbol>

<symbol id="zk">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#5287a2;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#5287a2;" 
        alignment-baseline="middle" text-anchor="middle"
    >ZK</text>
</symbol>

<symbol id="ol">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#5287a2;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#5287a2;" 
        alignment-baseline="middle" text-anchor="middle"
    >OL</text>
</symbol>

<symbol id="bp">
    <use xlink:href="#struct" style="fill:#d3990a;stroke:#d3990a;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >BP</text>
</symbol>

<symbol id="bs">
    <use xlink:href="#struct" style="fill:#d3990a;stroke:#d3990a;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >BS</text>
</symbol>

<symbol id="nx">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#d3990a;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#8bb148;" 
        alignment-baseline="middle" text-anchor="middle"
    >NX</text>
</symbol>

<symbol id="tc">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#d3990a;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#8bb148;" 
        alignment-baseline="middle" text-anchor="middle"
    >TC</text>
</symbol>

<symbol id="es">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#d3990a;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#8bb148;" 
        alignment-baseline="middle" text-anchor="middle"
    >ES</text>
</symbol>

<symbol id="ps">
    <use xlink:href="#struct" style="fill:#7a9543;stroke:#7a9543;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >PS</text>
</symbol>

<symbol id="qis">
    <use xlink:href="#struct" style="fill:#7a9543;stroke:#7a9543;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >QIS</text>
</symbol>


<symbol id="qd">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#7a9543;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#7a9543;" 
        alignment-baseline="middle" text-anchor="middle"
    >QD</text>
</symbol>

<symbol id="pg">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#7a9543;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#7a9543;" 
        alignment-baseline="middle" text-anchor="middle"
    >PG</text>
</symbol>

<symbol id="pgm">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#7a9543;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#7a9543;" 
        alignment-baseline="middle" text-anchor="middle"
    >PGm</text>
</symbol>

<symbol id="pgs">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#7a9543;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#7a9543;" 
        alignment-baseline="middle" text-anchor="middle"
    >PGs</text>
</symbol>


<symbol id="dp">
    <use xlink:href="#struct" style="fill:#c0504d;stroke:#c0504d;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ffffff;" 
        alignment-baseline="middle" text-anchor="middle"
    >DP</text>
</symbol>

<symbol id="ht">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#c0504d;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#c0504d;" 
        alignment-baseline="middle" text-anchor="middle"
    >HT</text>
</symbol>

<symbol id="my">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#c0504d;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#c0504d;" 
        alignment-baseline="middle" text-anchor="middle"
    >MY</text>
</symbol>


<symbol id="no">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#fb2b08;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#fb2b08;" 
        alignment-baseline="middle" text-anchor="middle"
    >No</text>
</symbol>

<symbol id="tg">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#ff6601;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ff6601;" 
        alignment-baseline="middle" text-anchor="middle"
    >TG</text>
</symbol>

<symbol id="if">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#ff6601;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ff6601;" 
        alignment-baseline="middle" text-anchor="middle"
    >IF</text>
</symbol>

<symbol id="gf">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#ff6601;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#ff6601;" 
        alignment-baseline="middle" text-anchor="middle"
    >GF</text>
</symbol>

`;

    var svgFooter = '</svg>';


    // Layout Constants
    var compWidth = 23;
    var compHeight = 16;
    var compSpacingV = 3;
    var compPadding = 2;

    var compTemplate = fp.template('<use xlink:href="#<%= comp %>"  x="<%= x %>" y="<%= y %>"/>');

    var nodeWidth = 27.6;
    var nodeHeight = 16;        // *Calculated
    var nodeSpacingH = 3;
    var nodePadding = 2;

    var nodeTemplate = fp.template('\n<rect id="node<%= id%>" x="<%= x %>" y="<%= y %>" width="27.6" height="<%= height %>" style="fill:#ffffff;stroke:#bfbfbf"/>');


    //var subnetWidth = 15;
    var subnetPaddingH = 7;
    var subnetPaddingV = 3;

    var subnetSpacingH = 15;

    var subnetTemplate = fp.template('\n<rect id="subnet<%= id %>" x="<%= x %>" y="<%= y %>" width="<%= width %>" height="<%= height %>" style="fill:#f2f2f2;stroke:#bfbfbf"/>');


    var tpComponents = [ "OL", "ZK", "CS", "HT", "No", "QD", "PG", "MY"];

    // Calculate Layout Geometry

    // Generate subnets
    var subnetsTotal = topology.subnets.length;
    var subnetsInDMZ = fp.countBy("dmz")(topology.subnets).true;


    var nodesSvg = [];



    var maxNodeComponents = fp.max(fp.map(i=>i.components.length)(topology.layout));

    var nodeHeightTotal = nodeHeight*maxNodeComponents
        + (maxNodeComponents-1)*nodeSpacingH
        + nodePadding*2 + 6;

    // 
    // 
    // upper row: iterate by dmz


    // lower row: iterate by non-dmz


    var subnetX = 0;
    var subnetY = 0;


    subnetX = 200; // TODO: Center the subnet(s)

    // make lookup table for component:isnative check
    var components = fp(portDefs.edge).reduce( (comps, comp) => {
        comps[comp.client.component] = comp.client.apigee;
        return comps;
    }, {});

// TODO: loop by tiers
    genSubnet( fp.filter({"dmz": true})(topology.subnets) );

    subnetX = 0;
    subnetY += 200;
    genSubnet( fp.reject({"dmz": true})(topology.subnets) );


    function genSubnet(subnets){
        fp.map( subnet => {

            console.log(subnet);

            var subnetNodes = subnet.nodes.length
            var subnetWidth = subnetNodes* nodeWidth + (subnetNodes-1)*nodeSpacingH + subnetPaddingH*2;

            nodesSvg.push( subnetTemplate({id: 1, x: subnetX, y: subnetY, width:  subnetWidth, height: nodeHeightTotal+20  }) );

            var nodeX = 0;
            var nodeY = 0;


            fp(topology.layout).keyBy('node').at(subnet.nodes).filter().reduce(
                (acc, i) => {
                    console.log(i.components); 
                    
                        acc.push( nodeTemplate({ id: i.node, x: 1+subnetX + subnetPaddingH + nodeX, y: subnetY + subnetPaddingV + nodeY, height: nodeHeightTotal }) );
                    
                        function genComps(comps, compX, compY, compInc){

                            var comps = fp(comps).reduce(
                                (acc, c) => {
                                    acc.push( compTemplate({comp: c.toLowerCase(), x: subnetX + subnetPaddingH + nodeX + compX, y: subnetY + subnetPaddingV + compY }) );
                                    compY += compInc();

                                    return acc;
                                }, nodesSvg
                            );      

                            return comps;          
                        };

                        acc.push( genComps( fp(i.components).filter(comp=>components[comp]), compPadding, compPadding, compY => compHeight + compSpacingV ) );

                        acc.push( genComps( fp(i.components).filter(comp=>!components[comp]).reverse(), compPadding, nodeHeightTotal - compPadding - compHeight -3, compY => -(compHeight + compSpacingV) ) );
                       
                        nodeX += nodeWidth + nodeSpacingH;
                        return acc;
                    }, nodesSvg );

            subnetX += subnetWidth + subnetSpacingH;

        })(subnets);
    }




    // Generate nodes

    // Generate components






    // console.log(svgHeader);
    // console.log(nodesSvg.join("\n"));
    // console.log(svgFooter);

    fs = require('fs');
    var svgstream = fs.createWriteStream( outputFile );
    svgstream.write( svgHeader);
    svgstream.write( nodesSvg.join('\n') );
    svgstream.write( svgFooter);
    svgstream.end();
}