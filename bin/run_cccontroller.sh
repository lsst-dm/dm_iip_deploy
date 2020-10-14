#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/base_init.sh

if [ -z $1 ];
then
    echo "$0: missing argument: container_version"
    exit 1
fi

container_version=$2

docker run -d \
    --network=host \
    -e "IIP_CONFIG_DIR=/home/$ARCHIVE_USER/config" \
    -e "IIP_CREDENTIAL_DIR=/home/$ARCHIVE_USER/.lsst" \
    -v /home/$ARCHIVE_USER/config:/home/$ARCHIVE_USER/config \
    -v /home/$ARCHIVE_USER/.lsst:/home/$ARCHIVE_USER/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstts/cccontroller:$container_version
