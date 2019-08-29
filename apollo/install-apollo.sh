#!/bin/bash

# download github release zips
cd ~
mkdir -p apollo/adminservice
mkdir -p apollo/configservice
mkdir -p apollo/portal

cd ~/apollo/adminservice
wget https://github.com/ctripcorp/apollo/releases/download/v1.4.0/apollo-adminservice-1.4.0-github.zip
unzip apollo-adminservice-1.4.0-github.zip

cd ~/apollo/configservice
wget https://github.com/ctripcorp/apollo/releases/download/v1.4.0/apollo-configservice-1.4.0-github.zip
unzip apollo-configservice-1.4.0-github.zip

cd ~/apollo/portal
wget https://github.com/ctripcorp/apollo/releases/download/v1.4.0/apollo-portal-1.4.0-github.zip
unzip apollo-portal-1.4.0-github.zip

