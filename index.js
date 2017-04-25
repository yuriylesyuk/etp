#!/usr/bin/env node

var program = require("commander");

program
    .version("0.3.12")

program
    .command("generate <artifact> <topology> [<output>]").alias("g")
    .description('Generate artifact')
    .option("-i")
    .action(function(artifact, topology, output){
        artifactType = artifact;
        topologyFile = topology;
        outputFile = output || 'con';
    });

var supportedArtifactTypes = ["diagram", "portrequest", "checkports" ];

program.on('--help', function(){
  console.log(' Supported artifact:  ' + supportedArtifactTypes.join(", "));
  console.log('');
});
program.parse(process.argv);



if( supportedArtifactTypes.indexOf( artifactType ) == -1 ){
   console.error('The artifact is not supported.');
   process.exit(1);
}

console.log(artifactType);

console.log(topologyFile);
console.log(outputFile);
