#!/bin/bash
set -xe

# install docker
yum install -y docker
systemctl start docker.service
systemctl enable docker.service