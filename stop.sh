#!/bin/bash

SERVICENAME="ntp"

printf "[apnex/control-${SERVICENAME}] stopping\n" 1>&2
docker rm -f "${SERVICENAME}" 2>/dev/null

# remove dangling image
docker rm -v $(docker ps -qa -f name="control-${SERVICENAME}" -f status=exited) 2>/dev/null
