#/bin/bash

# regen all example topologies using dev-time etc execution


# $1 topology to process
function process(){
    topology=$1

    echo "processing topology: ${topology}" 

    node ../index.js g diagram $PWD/${topology}-topology.json $PWD/${topology}-diagram.svg
    node ../index.js g portrequest $PWD/${topology}-topology.json $PWD/${topology}-portrequest.csv
    node ../index.js g inventory -u opapiadmin -k "~/.ssh/id_ansible" $PWD/${topology}-topology.json $PWD/${topology}-inventory.html
    node ../index.js g consulconnect -u opapiadmin -k "~/.ssh/id_ansible" $PWD/${topology}-topology.json $PWD/${topology}-inventory.html
    
    echo 
}




process "prod-2dc-19n-5sn"

process "uat-12n-4sn"

process "prod-1dc-19n-5sn"

process "uat-12n-4sn-allcore-v2"

