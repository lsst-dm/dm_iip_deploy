#!/bin/bash

# get the directory from which this script was executed
loc=$(dirname -- "$(realpath -- "$0")")  

# get full path of directory above the directory were the script is executed
root_dir=$(dirname -- "$(realpath -- "$loc")")

source $loc/base_init.sh

error_msg="$0: missing argument: -p [summit|tucson|ncsa] -c container_version"

export CONTAINER_VERSION=
export ARCHIVE_SITE=

while getopts p:c: option
do
case "${option}"
in
p)
    if [ "$OPTARG" = "summit" ]; then
       ARCHIVE_SITE=$OPTARG
    elif [ "$OPTARG" = "tucson" ]; then
       ARCHIVE_SITE=$OPTARG
    elif [ "$OPTARG" = "ncsa" ]; then
       ARCHIVE_SITE=$OPTARG
    else
        echo "-p argument must be 'summit', 'tucson' or 'ncsa'"
        exit 1
    fi;;
c) CONTAINER_VERSION=${OPTARG};;
esac
done

if [[ -z $ARCHIVE_SITE ]] || [[ -z $CONTAINER_VERSION ]]; then
    echo $error_msg
    exit 1
fi


docker run -d \
    --network host \
    --pid=host \
    --ipc=host \
    -e "OSPL_URI=file:///home/saluser/ts_ddsconfig/python/lsst/ts/ddsconfig/data/config/ospl-shmem.xml" \
    -e "LSST_DDS_DOMAIN_ID=0" \
    -e "IIP_CREDENTIAL_DIR=/home/$ARCHIVE_USER/.lsst" \
    -e "LSST_DDS_PARTITION_PREFIX=$ARCHIVE_SITE" \
    -e "LSST_DDS_INTERFACE=p3p2" \
    -e "LSST_DDS_RESPONSIVENESS_TIMEOUT=$LSST_DDS_RESPONSIVENESS_TIMEOUT" \
    -e "LSST_DDSI2_SERVICE_TRACING_VERBOSITY=finer" \
    -e "LSST_ENABLE_DURABILITY_SERVICE_TRACING=TRUE" \
    -u `id -u $USER`:`id -g $USER` \
    -v /home/$USER:/home/$USER \
    -v /data:/data \
    -v /repo:/repo \
    -v /tmp/docker_tmp:/tmp \
    -v $root_dir/etc/oods/config/$ARCHIVE_SITE:/config \
    ts-dockerhub.lsst.org/lsstdm/test-oods:$CONTAINER_VERSION
