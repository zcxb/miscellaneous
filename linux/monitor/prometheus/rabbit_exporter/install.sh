#!/bin/bash

mkdir -p ~/rabbitmq_exporter
cd ~/rabbitmq_exporter

curl -LO https://github.com/kbudde/rabbitmq_exporter/releases/download/v0.29.0/rabbitmq_exporter-0.29.0.linux-amd64.tar.gz
tar -zxf rabbitmq_exporter-0.29.0.linux-amd64.tar.gz

cd rabbitmq_exporter-0.29.0.linux-amd64
cp rabbitmq_exporter /usr/bin/rabbitmq_exporter

# RABBIT_USER=dahuasurvey RABBIT_PASSWORD=dahuasurvey

sudo firewall-cmd --permanent --zone=public --add-port=9149/tcp
sudo firewall-cmd --reload