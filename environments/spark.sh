#!/bin/bash
#move /home/ubuntu/.ssh authorized_keys from hadoop_namenode
#build on top of airflow executor
#mode hadoop folder from one of the data nodes to airflow executor with scp -r src_folder user@ip:dst_folder
#copy system variables from hadoop data node to airflow executor
sudo apt-get install ssh openjdk-8-jdk scala<<EOF
Y
EOF
sudo apt-get install openssh-server openssh-client
wget https://dlcdn.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz
tar -xzf spark-3.3.1-bin-hadoop3.tgz
mv spark-3.3.1-bin-hadoop3 spark
hdfs dfs -mkdir /spark-logs
pip3 install pyspark
