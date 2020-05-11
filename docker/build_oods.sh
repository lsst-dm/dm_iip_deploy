#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/versions.sh
docker-compose build oods
docker tag lsstts/oods:$OODS_CONTAINER_VERSION lsstts/at-oods:$OODS_CONTAINER_VERSION
docker tag lsstts/oods:$OODS_CONTAINER_VERSION lsstts/cc-oods:$OODS_CONTAINER_VERSION
