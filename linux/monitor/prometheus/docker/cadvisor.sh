#!/bin/bash

sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=44080:8080 \
  --detach=true \
  --name=cadvisor \
  --restart=always \
  google/cadvisor:latest