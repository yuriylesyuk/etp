
var fp = require("lodash/fp");



// TODO: REFACTOR: remove it
// function genRegionIdNodeId( onlySingleDC,  dcid, nodeid ){
//     return onlySingleDC ? "n"+ fp.padCharsStart('0')(2)(nodeid) : "dc" + dcid + "n"+ fp.padCharsStart('0')(2)(nodeid);
// }

// usage: 
//    var genNodeId = gu.genRegionIdNodeId( topology.regions.length === 1 );

// then 
// usage: 
//    genNodeId( node.dcid, node.id)

exports.genRegionIdNodeId = fp.curry( (onlySingleDC,  dcid, nodeid ) => {
    return onlySingleDC ? "n"+ fp.padCharsStart('0')(2)(nodeid) : "dc" + dcid + "n"+ fp.padCharsStart('0')(2)(nodeid);
})
