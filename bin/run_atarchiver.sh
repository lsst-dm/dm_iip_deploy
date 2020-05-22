#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/base_init.sh

if [ -z $1 ];
then
    echo "$0: missing arguments: lsst_dds_domain container_version"
    exit 1
fi

if [ -z $2 ];
then
    echo "$0: missing arguments: lsst_dds_domain container_version"
    exit 1
fi

lsst_dds_domain=$1
container_version=$2

echo docker run -d \
    -u `id -u $ARCHIVE_USER`:`id -g $ARCHIVE_USER` \
    --network=host \
    -e "IIP_CONFIG_DIR=/home/$ARCHIVE_USER/config" \
    -e "IIP_CREDENTIAL_DIR=/home/$ARCHIVE_USER/.lsst" \
    -e "LSST_DDS_DOMAIN=$lsst_dds_domain" \
    -v /home/$ARCHIVE_USER/config:/home/$ARCHIVE_USER/config \
    -v /home/$ARCHIVE_USER/.lsst:/home/$ARCHIVE_USER/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstts/atarchiver:$container_version

