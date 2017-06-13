About
=====
This repository contains a template [Vagrantfile][vagrantfile] for creating new [ZooKeeper][zookeeper]/[Kafka][kafka] cluster. As a result, you will have 64-bit [Ubuntu][ubuntu] 16.04 (Xenial Xerus) virtual machines running your own ZooKeeper/Kafka cluster.

If you need clustered Kafka setup without ZooKeeper, check out this [repository][vagrant-ubuntu-kafka]. Similarly, clustered ZooKeeper setup without bundled Kafka is available [here][vagrant-ubuntu-zk].

Getting Started
===============
Install [VirtualBox][virtualbox] (> 5.1.22), [Vagrant][vagrant] (> 1.9.5), clone this repository and execute `vagrant up`.

Default Setup
=============
By default, **3** ZooKeeper instances will be created. Instance details are as follow:

| Name | IP | RAM (MB) | CPUs | CPU Cap (%) |
| :---: | :---: | :---: | :---: | :---: |
| zk-01 | 10.10.10.11 | 1024 | 1 | 50 |
| zk-02 | 10.10.10.12 | 1024 | 1 | 50 |
| zk-03 | 10.10.10.13 | 1024 | 1 | 50 |

Also, **3** Kafka brokers will be created. Broker details are as follow:

| Name | IP | RAM (MB) | CPUs | CPU Cap (%) |
| :---: | :---: | :---: | :---: | :---: |
| kafka-01 | 10.10.10.21 | 1536 | 1 | 50 |
| kafka-02 | 10.10.10.22 | 1536 | 1 | 50 |
| kafka-03 | 10.10.10.23 | 1536 | 1 | 50 |

Custom Setup
============
You can override default configuration with your own `config.rb` file. See `config.rb.sample` form more information.

Default configuration assumes maximum number of 3 instances. If you want to create more instances, you will need to manually add new `server.n` entry to `zookeeper.properties` configuration file for each new ZooKeeper instance, where `n` is the instance number, and manually create `server.properties` configuration file for each new Kafka instance.

Scripts
=======
Some Kafka scripts have been included for convenience. Details are as follow:

| Script | Description |
| --- | --- |
| `/vagrant/sh/kafka-topics-create.sh [TOPIC]` | Creates a 3-partitioned and 3-replicated topic. |
| `/vagrant/sh/kafka-topics-describe.sh [TOPIC]` | Gives a summary of a topic. |
| `/vagrant/sh/kafka-topics-list.sh` | Lists all topics. |
| `/vagrant/sh/kafka-topics-delete.sh [TOPIC]` | Deletes a topics. |
| `/vagrant/sh/kafka-tools-get-offset.sh [TOPIC]` | Gives an offset of a topic. |
| `/vagrant/sh/kafka-console-producer.sh [TOPIC]` | Produces messages for a topic. Use `Ctrl+C` to exit. |
| `/vagrant/sh/kafka-console-consumer.sh [TOPIC]` | Consumes messages on a topic. Use `Ctrl+C` to exit. |

[vagrantfile]: https://www.vagrantup.com/docs/vagrantfile/
[zookeeper]: https://zookeeper.apache.org/
[kafka]: https://kafka.apache.org/
[ubuntu]: https://atlas.hashicorp.com/ubuntu/boxes/xenial64
[vagrant-ubuntu-kafka]: https://github.com/akoncic/vagrant-ubuntu-kafka
[vagrant-ubuntu-zk]: https://github.com/akoncic/vagrant-ubuntu-zk
[virtualbox]: https://www.virtualbox.org/
[vagrant]: https://www.vagrantup.com/
