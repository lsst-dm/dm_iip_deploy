#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/base_init.sh

error_msg = "$0: missing argument: -p [summit|ncsa] -c container_version"

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
        echo "-p argument must be summit or ncsa"
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
    --network=host \
    -u `id -u $ARCHIVE_USER`:`id -g $ARCHIVE_USER` \
    -e "IIP_CONFIG_DIR=/home/$ARCHIVE_USER/config/$ARCHIVE_SITE" \
    -e "IIP_CREDENTIAL_DIR=/home/$ARCHIVE_USER/.lsst" \
    -v /home/$ARCHIVE_USER/.lsst:/home/$ARCHIVE_USER/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    ts-dockerhub.lsst.org/lsstdm/atcontroller:$CONTAINER_VERSION
