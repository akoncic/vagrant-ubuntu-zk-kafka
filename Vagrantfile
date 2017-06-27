# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'

CONFIG = File.join(File.dirname(__FILE__), "config.rb")

# config.rb defaults
$instances = 3

$zookeeper_instance_name_prefix = "zk"
$zookeeper_vm_memory = 1024
$zookeeper_vm_cpus = 1
$zookeeper_vm_cpuexecutioncap = 50
$zookeeper_forwarded_ports = {}

$kafka_instance_name_prefix = "kafka"
$kafka_vm_memory = 1536
$kafka_vm_cpus = 1
$kafka_vm_cpuexecutioncap = 50
$kafka_forwarded_ports = {}

if File.exist?(CONFIG)
  require CONFIG
end

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  #config.ssh.forward_agent = true
  #config.ssh.insert_key = false

  config.vm.provision "shell", path: "provision/bootstrap.sh"

  # ZooKeeper
  (1..$instances).each do |i|

    config.vm.define vm_name = "%s-%02d" % [$zookeeper_instance_name_prefix, i] do |config|

      config.vm.hostname = vm_name
      config.vm.network "private_network", ip: "10.10.10.#{i+10}"

      $zookeeper_forwarded_ports.each do |guest, host|
        config.vm.network "forwarded_port", guest: guest, host: host, auto_correct: true
      end

      config.vm.provision "shell", path: "provision/zookeeper.sh", args: "#{i}"

      config.vm.provider "virtualbox" do |vm|
        vm.memory = $zookeeper_vm_memory
        vm.cpus = $zookeeper_vm_cpus
        vm.customize ["modifyvm", :id, "--cpuexecutioncap", "#{$zookeeper_vm_cpuexecutioncap}"]
      end

    end

  end

  # Kafka
  (1..$instances).each do |i|

    config.vm.define vm_name = "%s-%02d" % [$kafka_instance_name_prefix, i] do |config|

      config.vm.hostname = vm_name
      config.vm.network "private_network", ip: "10.10.10.#{i+20}"

      $kafka_forwarded_ports.each do |guest, host|
        config.vm.network "forwarded_port", guest: guest, host: host, auto_correct: true
      end

      config.vm.provision "shell", path: "provision/kafka.sh", :args => ["#{i}", "#{$instances}"]

      config.vm.provider "virtualbox" do |vm|
        vm.memory = $kafka_vm_memory
        vm.cpus = $kafka_vm_cpus
        vm.customize ["modifyvm", :id, "--cpuexecutioncap", "#{$kafka_vm_cpuexecutioncap}"]
      end

    end

  end

end
