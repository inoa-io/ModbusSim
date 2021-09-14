#!/bin/bash
DOCKER_IMAGE=inoa/modbus-simulator:0.1

docker build . -t ${DOCKER_IMAGE}


{
  sleep 5
  curl -X POST \
    -H "accept: application/json" \
    -H  "Content-Type: application/json" \
    -d @data/dzg-4013.json \
    "http://localhost:5002/dump"
  curl -X POST \
    -H "accept: application/json" \
    -H  "Content-Type: application/json" \
    -d @data/dzg-4013-2.json \
    "http://localhost:5002/dump"
} &

docker run -it --rm --name ModBusSim --privileged \
    -v /dev/ttyUSB0:/dev/ttyUSB0:rw \
    -e MODBUS_INTERFACE=/dev/ttyUSB0 \
    -p 5002:5002 \
    $DOCKER_IMAGE

