# etp alpha release


# ETP Edge Topology Processor

Utility to generate different artifacts using Edge topology configuration.

A configuration is written using JSON format. 

Examples of configurations can be seen in examples foler.

## Quick Start Guide

1. install utility from github

npm install -g https://github.com/yuriylesyuk/etp/tarball/master


2. Fetch an example file to your working folder

wget https://raw.githubusercontent.com/yuriylesyuk/etp/master/examples/uat-12n-4sn-topology.json


etp generate portrequest ./uat-12n-4sn-topology.json ./portrequest.csv


1. 

etp generate diagram ./examples/uat-12n-4sn-topology.json svgdiagram.svg