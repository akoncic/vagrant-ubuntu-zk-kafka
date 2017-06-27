#!/bin/bash

echo -e Starting ZooKeeper...
if [ ! -d /tmp/zookeeper ]; then
  sudo mkdir /tmp/zookeeper
  sudo echo $1 > /tmp/zookeeper/myid
fi

sudo cp -f /opt/kafka/config/zookeeper.properties /opt/kafka/config/zookeeper.properties.backup

sudo echo "server.$1=10.10.10.$((10+$1)):2888:3888" >> /opt/kafka/config/zookeeper.properties

/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties > /tmp/zookeeper.log &

echo -e ZooKeeper started!
