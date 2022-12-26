#!/bin/bash
#move /home/ubuntu/.ssh authorized_keys from hadoop_namenode
sudo apt-get install ssh openjdk-8-jdk scala<<EOF
Y
EOF
sudo apt-get install openssh-server openssh-client
sudo wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz
tar -xzf hadoop-3.3.3.tar.gz
mv hadoop-3.3.3 hadoop
sudo sed -i '1i export YARN_HOME=${HADOOP_HOME}' /home/ubuntu/.bashrc
sudo sed -i '1i export HADOOP_HDFS_HOME=${HADOOP_HOME}' /home/ubuntu/.bashrc
sudo sed -i '1i export HADOOP_COMMON_HOME=${HADOOP_HOME}' /home/ubuntu/.bashrc
sudo sed -i '1i export HADOOP_MAPRED_HOME=${HADOOP_HOME}' /home/ubuntu/.bashrc
sudo sed -i '1i export PATH=$PATH:$HADOOP_HOME/sbin' /home/ubuntu/.bashrc
sudo sed -i '1i export PATH=$PATH:$HADOOP_HOME/bin' /home/ubuntu/.bashrc
sudo sed -i '1i export HADOOP_HOME=/home/ubuntu/hadoop' /home/ubuntu/.bashrc
source ~/.bashrc
sudo mkdir -p /usr/local/hadoop/hdfs/data
sudo chown ubuntu:ubuntu -R /usr/local/hadoop/hdfs/data
chmod 700 /usr/local/hadoop/hdfs/data