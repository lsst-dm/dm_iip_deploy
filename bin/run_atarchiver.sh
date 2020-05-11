#!/bin/bash

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

docker run -d \
    -u `id -u ARC`:`id -g ARC` \
    --network=host \
    -e "IIP_CONFIG_DIR=/home/ARC/config" \
    -e "IIP_CREDENTIAL_DIR=/home/ARC/.lsst" \
    -e "LSST_DDS_DOMAIN=$lsst_dds_domain" \
    -v /home/ARC/config:/home/ARC/config \
    -v /home/ARC/.lsst:/home/ARC/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstts/atarchiver:$container_version
