#!/bin/bash

if [ -z $1 ];
then
    echo "$0: missing argument: container_version"
    exit 1
fi

container_version=$1

nohup docker run \
    -u `id -u ARC`:`id -g ARC` \
    --network=host \
    -e "IIP_CONFIG_DIR=/home/ARC/config" \
    -e "IIP_CREDENTIAL_DIR=/home/ARC/.lsst" \
    -e "LSST_DDS_DOMAIN=auxtelpath" \
    -v /home/ARC/config:/home/ARC/config \
    -v /home/ARC/.lsst:/home/ARC/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstdm/atarchiver:$container_version >>/var/log/iip/atarchiver_container.log &
