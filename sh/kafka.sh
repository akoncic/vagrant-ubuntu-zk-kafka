#!/bin/bash

echo -e ${HO}Starting Kafka...${HC}
#sudo /opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties
sudo /opt/kafka/bin/kafka-server-start.sh -daemon /vagrant/config/server$1.properties

echo -e ${HO}Done!${HC}
