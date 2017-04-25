# etp alpha release


# ETP Edge Topology Processor

Utility to generate different artifacts using Edge topology configuration definition.

A configuration is written using JSON format. 

Examples of configurations can be seen in the examples folder.

## Quick Start Guide

1. install utility from github

npm install -g https://github.com/yuriylesyuk/etp/tarball/master


2. Fetch an example topology to your working folder. 


wget https://raw.githubusercontent.com/yuriylesyuk/etp/master/examples/uat-19n-3sn-topology.json

or

wget https://raw.githubusercontent.com/yuriylesyuk/etp/master/examples/uat-12n-4sn-topology.json

3. Generate svg diagram for the topology

etp generate diagram $PWD/uat-19n-3sn-topology.json $PWD/svgdiagram.svg

4. Open generated svg file in your browser.


5. Generate firewall ports request

etp generate portrequest $PWD/uat-19n-3sn-topology.json $PWD/portrequest.csv


6. Open generated portrequest.cvs file in Excel.
