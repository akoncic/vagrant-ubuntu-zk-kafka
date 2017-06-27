#!/bin/bash

SCALA_VERSION="2.12"
KAFKA_VERSION="0.10.2.1"

echo -e Running apt-get update/upgrade...
sudo apt-get update -y
sudo apt-get upgrade -y

echo -e Installing 'openjdk-8-jre-headless'...
sudo apt-get install openjdk-8-jre-headless -y

sudo mkdir -p /opt/kafka
cd /opt/kafka

echo -e Downloading Kafka...
sudo wget "http://www-eu.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz"
sudo tar -xvzf "kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" --strip 1

sudo chmod u+x /vagrant/sh/*.sh
