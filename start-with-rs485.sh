#!/bin/bash
DOCKER_IMAGE=inoa/modbus-simulator:0.1


export CLOUDSDK_PYTHON=python2

export MODBUS_INTERFACE="${MODBUS_INTERFACE:-/dev/ttyUSB0}"


docker-compose -f ./docker-compose-rs485.yml up --build