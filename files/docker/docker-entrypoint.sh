#!/bin/sh

ARGS=${ARGS:-""}

if [ ! -z "${NAME}" ]; then
  ARGS=$ARGS" -a ${NAME}"
fi

if [ ! -z "${PIPE}" ]; then
  ARGS=$ARGS" -- ${PIPE}"
fi

if [ ! -z "${MULTICAST_INTERFACES}" ]; then
  for IF in ${MULTICAST_INTERFACES}; do
  	route add -net 224.0.0.0 netmask 224.0.0.0 $IF
  done;
fi

shairport-sync $ARGS