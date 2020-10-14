#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/base_init.sh

if [ -z $1 ];
then
    echo "$0: missing argument: lsst_dds_partition_prefix container_version"
    exit 1
fi

if [ -z $2 ];
then
    echo "$0: missing argument: lsst_dds_partition_prefix container_version"
    exit 1
fi

lsst_dds_partition_prefix=$1
container_version=$2

docker run -d \
    -u `id -u $ARCHIVE_USER`:`id -g $ARCHIVE_USER` \
    --network=host \
    -e "IIP_CONFIG_DIR=/home/$ARCHIVE_USER/config" \
    -e "IIP_CREDENTIAL_DIR=/home/$ARCHIVE_USER/.lsst" \
    -e "LSST_DDS_PARTITION_PREFIX=$lsst_dds_partition_prefix" \
    -v /home/$ARCHIVE_USER/config:/home/$ARCHIVE_USER/config \
    -v /home/$ARCHIVE_USER/.lsst:/home/$ARCHIVE_USER/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstts/atcontroller:$container_version
