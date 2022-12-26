#!/bin/bash
#
sudo apt-get update
sudo apt-get upgrade <<EOF
Y
EOF
########################################
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get install build-essential binutils gcc make git libpq-dev<<EOF
Y
EOF
sudo apt-get install python3 python3-dev python3-pip python3-wheel <<EOF
Y
EOF
#redis installation
sudo apt install redis-server<<EOF
Y
EOF
sudo sed -i "s|bind |#bind |" /etc/redis/redis.conf
sudo sed -i "s|protected-mode yes|protected-mode no|" /etc/redis/redis.conf
sudo sed -i "s|supervised no|supervised systemd|" /etc/redis/redis.conf
sudo service redis restart
#airflow installation
pip3 install psycopg2
pip3 install redis
pip3 install \
 apache-airflow[postgresql,celery]==2.5.0 \
 --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.5.0/constraints-3.10.txt"
echo 'export AIRFLOW_HOME="/home/ubuntu/airflow"' >> .profile
echo 'export SLUGIFY_USES_TEXT_UNIDECODE=yes' >> .profile
echo 'export PATH=$PATH:/home/ubuntu/.local/bin' >> .profile
. ~/.profile
mkdir /home/ubuntu/airflow/dags
mkdir /home/ubuntu/altenar_test_data
mkdir /home/ubuntu/altenar_reports
# change executor = CeleryExecutor in airflow.cfg
# change load_examples to False
# change sql_alchemy_conn in airflow.cfg
# change broker_url in [celery] section to point it to the airflow main 
# change result_backend in [celery] section to point it to the airflow main  
# airflow initdb
# airflow users create -r Admin -u username -e mail@mail.com -f firstname -l lastname-p password
# sudo ufw allow 8080