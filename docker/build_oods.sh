#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/versions.sh
docker-compose build oods
docker tag lsstdm/oods:$OODS_CONTAINER_VERSION lsstdm/at-oods:$OODS_CONTAINER_VERSION
docker tag lsstdm/oods:$OODS_CONTAINER_VERSION lsstdm/cc-oods:$OODS_CONTAINER_VERSION
