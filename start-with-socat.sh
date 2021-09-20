#!/bin/bash
DOCKER_IMAGE=inoa/modbus-simulator:0.1
SOCAT_DOCKER_IMAGE=inoa/socat:0.1

export CLOUDSDK_PYTHON=python2

export SOCAT_HOME="${PWD}/env/socat"
export SLAVE_INTERFACE="/ttySlave01"
export MASTER_INTERFACE="/ttyMaster01"

mkdir -p "${SOCAT_HOME}"

docker-compose -f ./docker-compose-socat.yml up --build
