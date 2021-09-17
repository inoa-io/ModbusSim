#!/bin/bash

export SOCAT_HOME="${PWD}/env/socat"
export SLAVE_INTERFACE="/ttySlave01"
export MASTER_INTERFACE="/ttyMaster01"


docker-compose -f ./docker-compose-socat.yml down
