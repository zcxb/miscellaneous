#!/bin/bash

yum search java | grep -i --color java-1.8.0
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

# default installed path: /usr/lib/jvm
ls /usr/lib/jvm

# vim /etc/profile

# set java environment  
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.<subversion>.x86_64
PATH=$PATH:$JAVA_HOME/bin  
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar  
export JAVA_HOME  CLASSPATH  PATH 

# save and refresh
source  /etc/profile
echo $JAVA_HOME
echo $PATH
echo $CLASSPATH

java -version