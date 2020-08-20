#!/usr/bin/env bash 

ip addr show ens192 | grep -oP '(?<=inet\s).*(?=/24)'