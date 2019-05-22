#!/bin/bash
set -xe

# create new user
user_name="zcxb"

useradd -d /home/${user_name} -m ${user_name}
passwd ${user_name}