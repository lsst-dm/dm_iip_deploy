#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/versions.sh
docker-compose build oods
docker tag ts-dockerhub.lsst.org/lsstdm/oods:$OODS_CONTAINER_VERSION ts-dockerhub.lsst.org/lsstdm/at-oods:$OODS_CONTAINER_VERSION
docker tag ts-dockerhub.lsst.org/lsstdm/oods:$OODS_CONTAINER_VERSION ts-dockerhub.lsst.org/lsstdm/cc-oods:$OODS_CONTAINER_VERSION
