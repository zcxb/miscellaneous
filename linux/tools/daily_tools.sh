#!/bin/bash
set -xe

# install fish
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install -y fish

# install vim
yum install -y vim

# install tmux
yum install -y tmux

# install and open ftp
yum install -y vsftpd
service vsftpd start

firewall-cmd --add-service=ftp --permanent # open ftp permanently
systemctl restart firewalld