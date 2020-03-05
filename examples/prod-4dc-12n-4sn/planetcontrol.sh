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
   $DRYRUN ansible dc1n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-3;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc3n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-3;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc3n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-3;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc3n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-4;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc4n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-4;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc4n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-4;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc4n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-zookeeper $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-1;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc1n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-2;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc2n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-3;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc3n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-3;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc3n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-3;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc3n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi




if [[ ";dc-4;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc4n01 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-4;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc4n02 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



if [[ ";dc-4;planet;" =~ ";$TARGET;" ]]
then
   $DRYRUN ansible dc4n03 -a $DRYESC$DRYQUOTE"apigee-service apigee-cassandra $ACTION$DRYESC$DRYQUOTE"
   if [[ $? -ne 0 ]]; then exit 1; fi
fi



















































































































