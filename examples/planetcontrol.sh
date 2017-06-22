#!/bin/bash
# check mandatory options

help(){
        echo ""
        echo "planetcontrol.sh <target> <action> [dryrun]"
        echo ""
        echo "Arguments:"
        echo ""
        echo " <target>: planet or dc-1 or dc-2"
        echo " <action>: start or stop"
        echo ""
        echo " <dryrun>: optional, if present the output command will be produced but not executed"
        echo ""
}

if [ "$#" -lt 2 ]
then
        echo "Wrong number of mandatory arguments supplied."
        echo.
    help
    exit 1
fi


TARGET=$1
ACTION=$2
DRYRUN=$3

if [[ ! ";dc-1;dc-2;planet;" =~ ";$TARGET;" ]]
then
   echo "Unsupported target: $TARGET"
   help
   exit 1
fi


if [[ ! ";start;stop;" =~ ";$ACTION;" ]]
then
   echo "Unsupported Action: $ACTION"
   help
   exit 1
fi

if [[ ! "$DRYRUN" == "" ]]
then
    DRYRUN="echo "
fi














if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n13 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n15 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n16 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n17 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n18 -a "apigee-service apigee-zookeeper $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n13 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n15 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n16 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n17 -a "apigee-service apigee-zookeeper $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n18 -a "apigee-service apigee-zookeeper $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n13 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n15 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n16 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n17 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n18 -a "apigee-service apigee-cassandra $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n13 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n15 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n16 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n17 -a "apigee-service apigee-cassandra $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n18 -a "apigee-service apigee-cassandra $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n13 -a "apigee-service apigee-openldap $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n13 -a "apigee-service apigee-openldap $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n19 -a "apigee-service apigee-qpidd $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n29 -a "apigee-service apigee-qpidd $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n19 -a "apigee-service apigee-qpidd $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n29 -a "apigee-service apigee-qpidd $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n19 -a "apigee-service apigee-postgresql $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n19 -a "apigee-service apigee-postgresql $ACTION"
fi












if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n03 -a "apigee-service edge-management-server $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n03 -a "apigee-service edge-management-server $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n01 -a "apigee-service edge-router $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n02 -a "apigee-service edge-router $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n01 -a "apigee-service edge-router $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n02 -a "apigee-service edge-router $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n03 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n04 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n05 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n06 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n07 -a "apigee-service edge-message-processor $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n03 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n04 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n05 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n06 -a "apigee-service edge-message-processor $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n07 -a "apigee-service edge-message-processor $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n19 -a "apigee-service edge-qpid-server $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n19 -a "apigee-service edge-qpid-server $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n19 -a "apigee-service edge-postgres-server $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n19 -a "apigee-service edge-postgres-server $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n03 -a "apigee-service edge-sap-ui $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n03 -a "apigee-service edge-sap-ui $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n10 -a "apigee-service apigee-elasticsearch $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n11 -a "apigee-service apigee-elasticsearch $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n10 -a "apigee-service apigee-elasticsearch $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n11 -a "apigee-service apigee-elasticsearch $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n10 -a "apigee-service baas-sap-usergrid $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n11 -a "apigee-service baas-sap-usergrid $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n10 -a "apigee-service baas-sap-usergrid $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n11 -a "apigee-service baas-sap-usergrid $ACTION"
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n10 -a "apigee-service baas-sap-portal $ACTION"
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n11 -a "apigee-service baas-sap-portal $ACTION"
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n10 -a "apigee-service baas-sap-portal $ACTION"
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n11 -a "apigee-service baas-sap-portal $ACTION"
fi



