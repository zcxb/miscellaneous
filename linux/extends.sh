#!/bin/bash

fdisk -l

vgs
vgextend <VGNAME> /dev/sda?

lvextend -L +10G /dev/mapper/centos-root
xfs_growfs /dev/mapper/centos-root

df -lh