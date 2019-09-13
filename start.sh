#!/bin/bash

# variables
IMAGE_NAME="apnex/control-ntp"
CONTAINER_NAME="ntp"
DOCKER_OPTS="--cap-add SYS_NICE --cap-add SYS_RESOURCE --cap-add SYS_TIME"

# function to check if container is running
function check_container() {
	docker ps --filter "name=${CONTAINER_NAME}" --format "{{.ID}}"
}

# function to start new docker container
function start_container() {
	docker run -d				\
		--name=${CONTAINER_NAME}	\
		-p 123:123/udp			\
		${DOCKER_OPTS}			\
	${IMAGE_NAME}
}
#		--restart=always		\

if [ "$(check_container)" != "" ]; then
	docker rm -f "${CONTAINER_NAME}"
fi
#docker rmi $(docker images -q ${IMAGE_NAME})
start_container
