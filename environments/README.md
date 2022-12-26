# Altenar test task environment
## AWS cloud infrustructure 
airflow_main (airflow scheduler/webserver)
airflow_executor_1 (airflow celery worker + pyspark over hadoop client)
hadoop_namenode (namenode + yarn)
hadoop_datanode_1 (datanode)
hadoop_datanode_2 (datanode)
## Settup applicable to all servers
before executing .sh scripts resolve restart issue:
sudo apt install needrestart
sudo needrestart -u NeedRestart::UI::stdio -r a
sudo reboot
run open_ports.sh on all 
# Network requirments
Network of cluster should be isolated on AWS security groups level. Could be configured using iptables.
Using localy based physical servers for hadoop nodes is crucial for efficiency. Hence, recomended to create LAN 
## Servers to run .sh scripts
airflow_main (airflow_main.sh)
airflow_executor_1 (airflow_executor.sh, spark.sh)
hadoop_namenode (hadoop_namenode.sh)
hadoop_datanode_1 (hadoop_datanode.sh)
hadoop_datanode_2 (hadoop_datanode.sh)
## Servers to setup systemd service
airflow_main (airflow_scheduler_service, airflow_webserver_service)
airflow_executor_1 (airflow_celery_worker)