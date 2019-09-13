#!/bin/bash

# vars
IMAGE_NAME="apnex/control-ntp"

# remove existing and rebuild image
docker rmi -f ${IMAGE_NAME} 2>/dev/null
docker build --rm --no-cache -t ${IMAGE_NAME} -f control-ntp.docker .

#CONTAINER_NAME="ntp"

# any additional docker run options you may want.
#DOCKER_OPTS="--cap-add SYS_NICE --cap-add SYS_RESOURCE --cap-add SYS_TIME"
