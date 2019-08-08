#!/bin/bash
set -xe

# create new user
user_name="zcxb"

useradd -d /home/${user_name} -m ${user_name}
passwd ${user_name}

# add to sudoers
visudo
$user_name ALL=(ALL) NOPASSWD: ALL

# add user to group docker
sudo usermod -aG docker $USER
service docker restart # restart docker service

# change ip
cd /etc/sysconfig/network-scripts
vim ifcfg-ens160