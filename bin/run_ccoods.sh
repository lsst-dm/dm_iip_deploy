#!/bin/bash

if [ -z $1 ];
then
    echo "$0: missing argument: container_version"
    exit 1
fi

container_version=$1

docker run -d \
    -u `id -u ARC`:`id -g ARC` \
    --network host \
    -e "OODS_CONFIG_FILE=/home/ARC/config/cc_oods.yaml" \
    -v /data:/data \
    -v /home/ARC/config:/home/ARC/config \
    lsstts/cc-oods:$container_version

