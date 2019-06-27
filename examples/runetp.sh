#!/bin/bash


#
#

help(){
        echo ""
        echo "runetp.sh <topology-name>"
        echo ""
        echo " Arguments:"
        echo ""
        echo "  <topology-name>: name of the topology with implicit naming convention."
        echo ""
        echo " Example:"
        echo "  ./runetp.sh dsy-qa-5ns"
        echo ""
}

if [ "$#" -lt 1 ]
then
        echo "Wrong number of mandatory arguments supplied."
        echo ""
    help
    exit 1
fi



ETP_HOME=~/dbc/etp

TOPOLOGY=$1

node $ETP_HOME/index.js g diagram $PWD/$TOPOLOGY-topology.json $PWD/$TOPOLOGY-diagram.svg
node $ETP_HOME/index.js g portrequest $PWD/$TOPOLOGY-topology.json $PWD/$TOPOLOGY-portrequest.csv
node $ETP_HOME/index.js g inventory -u srvtech -k "~/.ssh/id_srvtech" $PWD/$TOPOLOGY-topology.json $PWD/$TOPOLOGY-inventory.html
node $ETP_HOME/index.js g consulconnect -u srvtech -k "~/.ssh/id_srvtech" $PWD/$TOPOLOGY-topology.json $PWD/$TOPOLOGY-inventory.html
