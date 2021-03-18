#!/bin/bash

# get the directory from which this script was executed
loc=$(dirname -- "$(realpath -- "$0")")  

# get full path of directory above the directory were the script is executed
root_dir=$(dirname -- "$(realpath -- "$loc")")

source $loc/base_init.sh

error_msg="$0: missing argument: -p [summit|ncsa] -c container_version"

export CONTAINER_VERSION=
export ARCHIVE_SITE=

while getopts p:c: option
do
case "${option}"
in
p)
    if [ "$OPTARG" = "summit" ]; then
       ARCHIVE_SITE=$OPTARG
    elif [ "$OPTARG" = "ncsa" ]; then
       ARCHIVE_SITE=$OPTARG
    else
        echo "-p argument must be 'summit' or 'ncsa'"
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
    -e "OODS_CONFIG_FILE=/home/$ARCHIVE_USER/config/at_oods.yaml" \
    -v /data:/data \
    -v $root_dir/etc/oods/config/$ARCHIVE_SITE:/home/$ARCHIVE_USER/config \
    ts-dockerhub.lsst.org/lsstdm/at-oods:$CONTAINER_VERSION
