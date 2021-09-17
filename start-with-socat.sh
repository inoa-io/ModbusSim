#!/bin/bash
DOCKER_IMAGE=inoa/modbus-simulator:0.1
SOCAT_DOCKER_IMAGE=inoa/socat:0.1

export CLOUDSDK_PYTHON=python2

#docker build . -t ${DOCKER_IMAGE}
#docker build ./socat/ -t ${SOCAT_DOCKER_IMAGE}

export SOCAT_HOME="${PWD}/env/socat"
export SLAVE_INTERFACE="/ttySlave01"
export MASTER_INTERFACE="/ttyMaster01"

mkdir -p "${SOCAT_HOME}"

#{
#  sleep 7
#  curl -X POST \
#    -H "accept: application/json" \
#    -H  "Content-Type: application/json" \
#    -d @data/dzg-4013.json \
#    "http://localhost:5002/dump"
#  curl -X POST \
#    -H "accept: application/json" \
#    -H  "Content-Type: application/json" \
#    -d @data/dzg-4013-2.json \
#    "http://localhost:5002/dump"
#
#} &

docker-compose -f ./docker-compose-socat.yml up --build
