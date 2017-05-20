
var fp = require("lodash/fp");


module.exports = function ( topologyFile, outputFile ){

function isApigeeComponent( portdefs, component ) {
    // make lookup table for component:isApigee check
    var isApigee = fp(portdefs.mappings.edge).reduce( (comps, comp) => {
            comps[comp.client.component] = comp.client.apigee;
            return comps;
    }, {});
};

// Usage: 

 var isApigee = fp.partial(isApigeeComponent, portdefs);

// Then later: 
 if( isApigee("CS") ){};