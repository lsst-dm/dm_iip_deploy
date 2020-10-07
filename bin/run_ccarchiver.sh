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
network_interface_address=$3
domain_id="0"
if [ -n $4 ];
then
    domain_id=$4
fi

docker run -d \
    -u `id -u $ARCHIVE_USER`:`id -g $ARCHIVE_USER` \
    --network=host \
    -e "DOMAIN_ID=$domain_id" \
    -e "NETWORK_INTERFACE_ADDRESS=$network_interface_address" \
    -e "IIP_CONFIG_DIR=/home/$ARCHIVE_USER/config" \
    -e "IIP_CREDENTIAL_DIR=/home/$ARCHIVE_USER/.lsst" \
    -e "LSST_DDS_PARTITION_PREFIX=$lsst_dds_partition_prefix" \
    -e "LSST_DDS_QOS=file://home/$ARCHIVE_USER/ts_idl/qos/QoS.xml" \
    -v /home/$ARCHIVE_USER/config:/home/$ARCHIVE_USER/config \
    -v /home/$ARCHIVE_USER/.lsst:/home/$ARCHIVE_USER/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstts/ccarchiver:$container_version
