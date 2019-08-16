#!/bin/bash
set -xe

uname -r

# yum update

# clean old version
yum remove docker docker-common docker-selinux docker-engine -y

# install yum-util
yum install -y yum-utils device-mapper-persistent-data lvm2

# add yum source
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# check docker versions
yum list docker-ce --showduplicates | sort -r

# install docker
yum install docker-ce -y

systemctl start docker
systemctl enable docker

# see if installed
docker version

# install lazydocker 
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash


# add docker0 to firewalld rule
firewall-cmd --permanent --zone=public --add-rich-rule="rule family=ipv4 source address=172.17.0.1/16 accept"