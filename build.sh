#!/bin/sh

set -xe

# Build Raspberry Pi image
docker build -t mruettgers/rpi-shairport-sync -f targets/rpi/Dockerfile .

# Build amd64 image
#docker build -t mruettgers/shairport-sync -f targets/amd64/Dockerfile .
