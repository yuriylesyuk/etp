var fp = require("lodash/fp");


module.exports = function ( topologyFile, outputFile ){
    var portDefs = require("./edge-port-defs.json");

    var topology = require( topologyFile );
    //var topology = require("./uat-19n-3sn-topology.json");


    // TODO: templatize height and width of svg

    var svgHeaderTemplate = fp.template( `<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
xmlns:svg="http://www.w3.org/2000/svg"
xmlns="http://www.w3.org/2000/svg"
xmlns:xlink="http://www.w3.org/1999/xlink"
height="<%= height %>"
width="<%= width %>"
xml:space="preserve"
version="1.1"
id="svg2">
` );
    var svgSymbols = `
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

<symbol id="git">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#fb2b08;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#fb2b08;" 
        alignment-baseline="middle" text-anchor="middle"
    >GIT</text>
</symbol>

<symbol id="jnk">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#fb2b08;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#fb2b08;" 
        alignment-baseline="middle" text-anchor="middle"
    >Jnk</text>
</symbol>

<symbol id="mvn">
    <use xlink:href="#struct" style="fill:#ffffff;stroke:#fb2b08;"/>
    <text id="text1488" x="12.5" y="10.5"
        style="font-weight:bold;font-size:9px;font-family:Arial;fill:#fb2b08;" 
        alignment-baseline="middle" text-anchor="middle"
    >Mvn</text>
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
    var nodeSpacingH = 3;
    var nodePadding = 2;

    var nodeTemplate = fp.template(`\n
    <rect id="node<%= id %>" x="<%= x %>" y="<%= y %>" width="27.6" height="<%= height %>" style="fill:#ffffff;stroke:#bfbfbf">
        <title><%= tooltip %></title>
    </rect>
    <text id="nodetext<%= id %>" x="<%= textx() %>" y="<%= texty() %>" style="font-weight:normal;font-size:7.5px;font-family:Arial;"
        alignment-baseline="middle" text-anchor="middle"><%= text() %></text>
    `);


    //var subnetWidth = 15;
    var subnetPaddingH = 7;
    var subnetPaddingV = 3;

    var subnetFooter = 20;
    var subnetSpacingH = 15;

    var subnetTemplate = fp.template(
                `\n<rect id="subnet<%= id %>" x="<%= x %>" y="<%= y %>" width="<%= width %>" height="<%= height %>" style="fill:#f2f2f2;stroke:#bfbfbf">
                    <title><%= tooltip %></title>
                </rect>`
            );

    var tierHeader = 20;
    var tierSpacingV = 10;
    var tierHeaderTemplate = fp.template(`
        <line x1="<%= x1 %>" y1="<%= y1 %>" x2="<%= x2 %>" y2="<%= y2 %>" style="stroke:#7f7f7f;;stroke-width:0.5;stroke-dasharray:6, 2;stroke-dashoffset:0;"/>
        <text id="text1488" x="<%= x %>" y="<%= y %>" style="font-weight:normal;font-size:8px;font-family:Arial;" text-anchor="end"><%= name %></text>
    `);

    var regionHeader = 12;
    var regionFooter = 12;
    var regionPaddingH = 7;
    var regionSpacingH = 30;
    var regionHeaderTemplate = fp.template(`
        <text id="text1488" x="<%= x %>" y="<%= y %>" style="font-weight:bold;font-size:10px;font-family:Arial;" text-anchor="start"><%= name %></text>
    `);
    var regionSeparatorTemplate = fp.template(`
        <line id="lineSep1" x1="<%= x1 %>" y1="<%= y1 %>" x2="<%= x2 %>" y2="<%= y2 %>" style="stroke:#7f7f7f;;stroke-width:2;stroke-dasharray:6, 2;stroke-dashoffset:0;"/>
    `);


    var tpComponents = [ "OL", "ZK", "CS", "HT", "No", "QD", "PG", "MY"];

    // Calculate Layout Geometry
    var nodesSvg = [];    // svg shapes accumulator

    function getNodeHeight( comps ){
        return compHeight * comps
            + (comps-1)*nodeSpacingH
            + nodePadding*2 + 6;
    };

// RIP: [Refactoring in process]: if we switch layout on tier-by-tier for node height, we do not need maxNodeComponents anymore
//    var maxNodeComponents = fp.max( fp.flatMap( subnet => subnet.nodes  )(region.subnets).map( node => node.components.length ) );
//
//    var nodeHeight = getNodeHeight( maxNodeComponents );
//    var subnetHeight = getNodeHeight( maxNodeComponents) + subnetFooter;   // -- node name + paddings

    // var tierHeight = tierHeader + subnetHeight;  // 40 -- tier divider and name + subnet name + paddings

    // 
    // 

    // make lookup table for component:isApigee check
    var isApigee = fp(portDefs.edge).reduce( (comps, comp) => {
        comps[comp.client.component] = comp.client.apigee;
        return comps;
    }, {});

    //
    // Pan-Diagram variables coordinate accumulators
    //
    var regionX = 0;
    var regionY = 0;

    var separatorFlipOn = false;
    var separatorY = 0;

    // Iterate by regions/data centres
    regionX += regionPaddingH
    fp.map(region => {
        regionY = regionHeader;

        if( separatorFlipOn ){
            nodesSvg.push( regionSeparatorTemplate({ 
                x1: regionX + regionSpacingH/2, y1: regionY, 
                x2: regionX + regionSpacingH/2, y2: separatorY
            }) );  

            regionX += regionSpacingH;
        }else{
            separatorFlipOn = true;
        }

        nodesSvg.push( regionHeaderTemplate({ 
            x: regionX, y: regionY + 4 , 
            name: region.name.toUpperCase(),  
        }) );  
        regionY += regionHeader;

        drawRegion( region );

        separatorY = regionY;

    })(topology.regions)
    regionX += regionPaddingH

    function drawRegion( region ){
        // Iterate collection of subnets by tier -- vertical layout
        // Pass I: calculate Maximum Tier Width and Tier Subnets TotalHeight Array
        var tierSizes = fp.keyBy( "tier" )
                (fp.map( tier => {

                var tierSize = fp.map( 
                        subnet => {
                            var subnetWidth = getSubnetWidth( subnet );
                            var subnetMaxComps = fp.max( fp.map( node => node.components.length )(subnet.nodes) );

                            return { width: subnetWidth, maxComps: subnetMaxComps };
                        })(
                        fp.filter( { "tier": tier.name } )(region.subnets)
                    ).reduce( ( tierSize, subnetSize ) => { 
                                    return { 
                                        width: tierSize.width === 0 ? subnetSize.width : tierSize.width + subnetSpacingH + subnetSize.width, 
                                        maxNodeComponents: tierSize.maxNodeComponents > subnetSize.maxComps ? tierSize.maxNodeComponents : subnetSize.maxComps
                                    }
                    }, { width: 0, maxNodeComponents: 0 }  );

                    return { tier: tier.name, width: tierSize.width, nodeHeight: getNodeHeight( tierSize.maxNodeComponents ) }

                })(region.tiers));

        var maxTierWidth = fp(tierSizes).reduce( 
            (maxtiersize, tiersize) => { 
                return maxtiersize > tiersize.width? maxtiersize: tiersize.width 
            }, 0
        )

        // Pass II: generate tier layout
        var subnetX = 0;
        var subnetY = 0;

        fp.map( tier => {

            nodesSvg.push( tierHeaderTemplate({ 
                x1: regionX + 0, y1: regionY + subnetY, 
                x2: regionX + maxTierWidth, y2: regionY + subnetY,
                x: regionX + maxTierWidth, y: regionY + subnetY+8, 
                name: tier.name.toUpperCase(),  
            }) );

            subnetX = ( maxTierWidth - tierSizes[ tier.name ].width )/2;    // Center this tier subnets
            subnetY += tierHeader

            fp.map(
                subnet => {
                    //console.log(subnet);              

                    drawSubnet( subnet, tierSizes[tier.name].nodeHeight, regionX + subnetX, regionY + subnetY )

                    subnetX += getSubnetWidth( subnet ) + subnetSpacingH;


                })(
                fp.filter( { "tier": tier.name } )(region.subnets)
            )
            subnetY += tierSizes[tier.name].nodeHeight+subnetFooter + tierSpacingV;

        })( region.tiers );

        regionX += maxTierWidth;
        regionY = subnetY;
   }

    function getSubnetWidth( subnet ){
        return subnet.nodes.length* nodeWidth + (subnet.nodes.length-1)*nodeSpacingH + subnetPaddingH*2;
    }


    function drawSubnet( subnet, nodeHeight, subnetX, subnetY  ){

            var subnetWidth = getSubnetWidth( subnet );

            nodesSvg.push( subnetTemplate(
                {   
                    id: 1, x: subnetX, y: subnetY, 
                    width:  subnetWidth, height: nodeHeight+subnetFooter,
                    tooltip: "Subnet: " + subnet.name
                }) 
            );

            var nodeX = 0;
            var nodeY = 0;

            // Generate nodes
            fp.reduce(
                (acc, node) => {
                        // console.log(i.components); 
                    
                        acc.push( nodeTemplate({ 
                            id: node.id, 
                            tooltip: "Node: " + node.id + "\nHost Name: " + node.hostname + "\nIP: " + node.ip,
                            x: 1+subnetX + subnetPaddingH + nodeX, 
                            y: subnetY + subnetPaddingV + nodeY, 
                            height: nodeHeight,
                            textx: function(){ return this.x + nodeWidth/2 }, 
                            texty: function(){ return this.y + this.height + 8 },
                            text: function() { return "Node " + this.id }
                         }) );
                    
                        function drawComponents(comps, compX, compY, compInc){

                            var comps = fp(comps).reduce(
                                (acc, c) => {
                                    acc.push( compTemplate({comp: c.toLowerCase(), x: subnetX + subnetPaddingH + nodeX + compX, y: subnetY + subnetPaddingV + compY }) );
                                    compY += compInc();

                                    return acc;
                                }, nodesSvg
                            );      

                            return comps;          
                        };

                        // Generate components: Apigee
                        acc.push( drawComponents( fp(node.components).filter(comp=>isApigee[comp]), compPadding, compPadding, compY => compHeight + compSpacingV ) );

                        // Generate components: 3rd Parties
                        acc.push( drawComponents( fp(node.components).filter(comp=>!isApigee[comp]).reverse(), compPadding, nodeHeight - compPadding - compHeight -3, compY => -(compHeight + compSpacingV) ) );
                       
                        nodeX += nodeWidth + nodeSpacingH;
                        return acc;
                    }, nodesSvg 
                )(subnet.nodes);
    }


    //---------------------------------
    // console.log(svgHeader);
    // console.log(nodesSvg.join("\n"));
    // console.log(svgFooter);

    fs = require('fs');
    var svgstream = fs.createWriteStream( outputFile );
    svgstream.write( svgHeaderTemplate( { height: regionY + regionFooter + 10, width: regionX } ));
    svgstream.write( svgSymbols );
    svgstream.write( nodesSvg.join('\n') );
    svgstream.write( svgFooter);
    svgstream.end();
}