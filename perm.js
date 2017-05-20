var fp = require("lodash/fp");


var a = [ "dc-1", "dc-2", "dc-3"];
//var a = [ "dc-1"];

console.log("----");
//  for a same dc brach: 
//      it is a single dc situation: 
//          use subnets within dc
//  for different dc branches
//      it is a multi-dc situation:
//          a) collate left and right dcs into two subnets 
//             by filtering just needed client components
//          b) pretend it is a 2 subnet single dc
fp.map( ldc => 
    fp.map( rdc => {
        if( ldc === rdc ){
            console.log( "same dc", ldc );
        }else{
            console.log( "cross dc", ldc,rdc );
        }
    })(a)
)(a);