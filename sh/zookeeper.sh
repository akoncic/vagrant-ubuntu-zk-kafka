#!/bin/bash

echo -e ${HO}Starting ZooKeeper...${HC}
if [ ! -d /tmp/zookeeper ]; then
  sudo mkdir /tmp/zookeeper
  sudo echo $1 > /tmp/zookeeper/myid
fi

sudo cp /vagrant/config/zookeeper.properties /opt/kafka/config/zookeeper.properties
/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties > /tmp/zookeeper.log &

echo -e ${HO}Done!${HC}
