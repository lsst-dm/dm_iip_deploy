#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/base_init.sh

if [ -z $1 ];
then
    echo "$0: missing argument: container_version"
    exit 1
fi

container_version=$1

docker run -d \
    -u `id -u $ARCHIVE_USER`:`id -g $ARCHIVE_USER` \
    --network host \
    -e "OODS_CONFIG_FILE=/home/$ARCHIVE_USER/config/cc_oods.yaml" \
    -v /data:/data \
    -v /home/$ARCHIVE_USER/config:/home/$ARCHIVE_USER/config \
    lsstts/cc-oods:$container_version

