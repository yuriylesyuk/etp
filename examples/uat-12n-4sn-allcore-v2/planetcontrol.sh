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


if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service apigee-influx $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n04 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n05 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n06 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n07 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n08 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n11 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n12 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n13 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service apigee-telegraf $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service apigee-grafana $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n04 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n04 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-openldap $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-openldap $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-postgresql $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n13 -a $DRYESC$DRYQUOTE"apigee-service apigee-postgresql $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi






if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n01 -a $DRYESC$DRYQUOTE"apigee-service edge-postgres-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n13 -a $DRYESC$DRYQUOTE"apigee-service edge-postgres-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n13 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service apigee-qpidd $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n01 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n13 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service edge-qpid-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service edge-management-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service edge-management-server $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n05 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n06 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n07 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n08 -a $DRYESC$DRYQUOTE"apigee-service edge-message-processor $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n07 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n08 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n11 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n12 -a $DRYESC$DRYQUOTE"apigee-service edge-router $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service edge-sap-ui $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service edge-sap-ui $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service apigee-elasticsearch $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service apigee-elasticsearch $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service baas-sap-usergrid $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service baas-sap-usergrid $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n09 -a $DRYESC$DRYQUOTE"apigee-service baas-sap-portal $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible n14 -a $DRYESC$DRYQUOTE"apigee-service baas-sap-portal $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



