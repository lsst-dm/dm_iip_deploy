#!/bin/bash

if [ -z $1 ];
then
    echo "$0: missing argument: container_version"
    exit 1
fi

container_version=$1

nohup docker run \
    -u `id -u ARC`:`id -g ARC` \
    --network host \
    -e "OODS_CONFIG_FILE=/home/ARC/config/cc_oods.yaml" \
    -v /data:/data \
    -v /home/ARC/config:/home/ARC/config \
    lsstdm/cc-oods:$container_version 2>&1 >/var/log/iip/cc_oods.log&

