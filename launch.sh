#!/bin/bash

# Constants
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DCK_IMG="jsacrist/jekyll/minimal-mistakes:latest"
SRV_DIR="/srv/jekyll"

# User-provided variables
# If user provides a config-dir, also pass it as a volume "-v ${CONFIG_DIR}:/config \"
# CONFIG_DIR="${DIR}/config"
CONTENT_DIR="${DIR}/content"
PORT=4000

# Execution call
docker run --rm -it \
    -p ${PORT}:4000 \
    -v ${CONTENT_DIR}:/content \
    ${DCK_IMG} /config/start.sh
