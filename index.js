#!/usr/bin/env node

var program = require("commander");

program
    .version(require('./package').version);

program
    .command("generate <artifact> <topology> [<output>]").alias("g")
    .description('Generate artifact')
    .action(function (artifact, topology, output) {
        artifactType = artifact || "<notprovided>";
        topologyFile = topology;
        outputFile = output || 'con';
    });

program.on('*', function () {
    console.log('Unknown Command: ' + program.args.join(' '));
    program.help();
})

var supportedArtifactTypes = ["diagram", "portrequest", "checkports"];

program.on('--help', function () {
    console.log(' Supported artifact:  ' + supportedArtifactTypes.join(", "));
    console.log('');
});
program.parse(process.argv);

if (!process.argv.slice(2).length) {
    program.outputHelp();
    process.exit(1);
}

if (supportedArtifactTypes.indexOf(artifactType) == -1) {
    console.error(`The artifact '${artifactType}' is not supported.`);
    process.exit(1);
}

//console.log(artifactType);
//console.log(topologyFile);
//console.log(outputFile);

if( artifactType === "portrequest"){
    var generatePortRequest = require( "./generatePortRequest.js" );

    generatePortRequest(topologyFile, outputFile);
}else if (artifactType === "diagram" ){
    var generateSvgDiagram = require( "./generateSvgDiagram.js" );

    generateSvgDiagram(topologyFile, outputFile);
}
