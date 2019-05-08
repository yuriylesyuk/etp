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
    DRYESC=""
    DRYQUOTE='"'
fi














if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n05 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n06 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n07 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n05 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n06 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n07 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n05 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n06 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n07 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n05 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n06 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n07 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n04 -a $DRYESC$DRYQUOTE"apigee-service apigee-openldap $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n04 -a $DRYESC$DRYQUOTE"apigee-service apigee-openldap $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n14 -a $DRYESC$DRYQUOTE"apigee-service apigee-postgresql $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi








if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n14 -a $DRYESC$DRYQUOTE"apigee-service apigee-postgresql $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi








if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n14 -a $DRYESC$DRYQUOTE"apigee-service edge-postgres-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n14 -a $DRYESC$DRYQUOTE"apigee-service edge-postgres-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n12 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n13 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n12 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n13 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n12 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n13 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n12 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n13 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n04 -a $DRYESC$DRYQUOTE"apigee-service edge-management-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n04 -a $DRYESC$DRYQUOTE"apigee-service edge-management-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n01 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n02 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n03 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n08 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n09 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n01 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n02 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n03 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n08 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n09 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n01 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n02 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n03 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n08 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n09 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n01 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n02 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n03 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n08 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n09 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n04 -a $DRYESC$DRYQUOTE"apigee-service edge-sap-ui $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";he-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n04 -a $DRYESC$DRYQUOTE"apigee-service edge-sap-ui $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi















