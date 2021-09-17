#!/bin/bash

echo "Starting socat with ${SLAVE_INTERFACE} and ${MASTER_INTERFACE}..."

socat -d -d pty,raw,echo=0,link=${SLAVE_INTERFACE}, pty,raw,echo=0,link=${MASTER_INTERFACE}

echo "Socat stopped."