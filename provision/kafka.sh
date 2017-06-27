#!/bin/bash

function join { local IFS="$1"; shift; echo "$*"; }

expand_zk_ip_range() {
  declare -a IP_RANGE=()

  for (( n=1 ; n<=$1 ; n++))
  do
    IP="10.10.10.$((10+${n})):2181"
    IP_RANGE+=($IP)
  done

  echo "${IP_RANGE[@]}"
}

echo -e Configuring Kafka...

sudo cp -f /opt/kafka/config/server.properties /opt/kafka/config/server.properties.backup

sudo sed -r -i "s/(broker.id)=(.*)/\1=$1/g" /opt/kafka/config/server.properties
sudo sed -r -i "s/#(advertised.listeners)=(.*)/\1=PLAINTEXT:\/\/10.10.10.$((20+$1)):9092/g" /opt/kafka/config/server.properties
sudo sed -r -i "s/(num.partitions)=(.*)/\1=$2/g" /opt/kafka/config/server.properties
sudo sed -r -i "s/(zookeeper.connect)=(.*)/\1=$(join , $(expand_zk_ip_range $2))/g" /opt/kafka/config/server.properties

echo -e Starting Kafka daemon...
sudo /opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties

echo -e Kafka daemon started!
