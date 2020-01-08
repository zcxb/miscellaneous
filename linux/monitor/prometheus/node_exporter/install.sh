#!/bin/bash

mkdir -p ~/node_exporter
cd ~/node_exporter

curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar -zxf node_exporter-0.18.1.linux-amd64.tar.gz

cd node_exporter-0.18.1.linux-amd64
cp node_exporter /usr/bin/node_exporter

# nohup ./node_exporter > nodeout.file 2>&1 &

sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
sudo firewall-cmd --reload