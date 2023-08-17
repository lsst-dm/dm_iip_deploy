#!/bin/bash

# get the directory from which this script was executed
loc=$(dirname -- "$(realpath -- "$0")")  

# get full path of directory above the directory were the script is executed
root_dir=$(dirname -- "$(realpath -- "$loc")")

source $loc/base_init.sh

error_msg="$0: missing argument: -p [summit|tucson] -c container_version"

export CONTAINER_VERSION=
export ARCHIVE_SITE=
export LSST_DDS_INTERFACE=

while getopts p:c: option
do
case "${option}"
in
p)
    if [ "$OPTARG" = "summit" ]; then
       ARCHIVE_SITE=$OPTARG
        LSST_DDS_INTERFACE=em2.1201
    elif [ "$OPTARG" = "tucson" ]; then
       ARCHIVE_SITE=$OPTARG
        LSST_DDS_INTERFACE=dds
    else
        echo "-p argument must be 'summit' or 'tucson'"
        exit 1
    fi;;
c) CONTAINER_VERSION=${OPTARG};;
esac
done

if [[ -z $ARCHIVE_SITE ]] || [[ -z $CONTAINER_VERSION ]]; then
    echo $error_msg
    exit 1
fi

docker run \
    -d \
    -t \
    --name="mtoods" \
    --network=host \
    --pid=host \
    --ipc=host \
    -e "OSPL_URI=file:///home/saluser/ts_ddsconfig/python/lsst/ts/ddsconfig/data/config/ospl-shmem.xml" \
    -e "CTRL_OODS_CONFIG_FILE=/home/$ARCHIVE_USER/config/cc_oods.yaml" \
    -e "LSST_DDS_DOMAIN_ID=0" \
    -e "LSST_DDS_PARTITION_PREFIX=$ARCHIVE_SITE" \
    -e "LSST_DDS_INTERFACE=$LSST_DDS_INTERFACE" \
    -e "LSST_DDS_RESPONSIVENESS_TIMEOUT=$LSST_DDS_RESPONSIVENESS_TIMEOUT" \
    -e "LSST_DDSI2_SERVICE_TRACING_VERBOSITY=finer" \
    -e "LSST_ENABLE_DURABILITY_SERVICE_TRACING=TRUE" \
    -v /home/$ARCHIVE_USER/.lsst:/home/$ARCHIVE_USER/.lsst \
    -v /data:/data \
    -v /repo:/repo \
    -v /tmp/docker_tmp:/tmp \
    -v $root_dir/docker/etc/oods/config/$ARCHIVE_SITE:/home/$ARCHIVE_USER/config \
    ts-dockerhub.lsst.org/mtoods:$CONTAINER_VERSION
