#!/bin/bash
#before executing script resolve restart issue
#sudo apt install needrestart
#sudo needrestart -u NeedRestart::UI::stdio -r a
#sudo reboot
#create ssh key
#sudo ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
#cat .ssh/id_rsa.pub >> ~/.ssh/authorized_keys
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
# sudo sed -i "s+JAVA_HOME= +JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64+" ~/hadoop/etc/hadoop/hadoop-env.sh
sudo mkdir -p /usr/local/hadoop/hdfs/data
sudo chown ubuntu:ubuntu -R /usr/local/hadoop/hdfs/data
chmod 700 /usr/local/hadoop/hdfs/data