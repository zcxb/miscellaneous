#!/usr/bin/env bash

# install directly
docker run -p 1337:1337 \
    --network kong-net \
    --name konga \
    pantsel/konga
