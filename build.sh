#!/bin/sh

set -xe

# Build Raspberry Pi image
docker build -t mruettgers/rpi-shairport-sync rpi/

# Build amd64 image
docker build -t mruettgers/shairport-sync amd64/
