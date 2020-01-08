#!/bin/bash

mkdir -p ~/redis_exporter
cd ~/redis_exporter

curl -LO https://github.com/oliver006/redis_exporter/releases/download/v1.3.4/redis_exporter-v1.3.4.linux-amd64.tar.gz
tar -zxf redis_exporter-v1.3.4.linux-amd64.tar.gz

cd redis_exporter-v1.3.4.linux-amd64
nohup ./redis_exporter --redis.addr=localhost:6379 --redis.password=<PWD> -web.listen-address=0.0.0.0:9121 > redisout.file 2>&1 &