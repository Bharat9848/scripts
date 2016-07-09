#!/bin/sh
if [ -d $1 ]
then
	$1/bin/zookeeper-server-start.sh $1/config/zookeeper.properties &
	env JMX_PORT=9999 $1/bin/kafka-server-start.sh $1/config/server.properties &
	$1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic myTopic &
fi
