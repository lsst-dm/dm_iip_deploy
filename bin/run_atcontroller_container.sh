#!/bin/bash

# default to site "tucson", if there are no arguments
if [ -z "$1" ]
then
    site="tucson"
else
    site=$1
fi

# check to be sure the config directory exists
configdir="/home/ARC/config/${site}"

docker run \
    -u `id -u ARC`:`id -g ARC` \
    --network=host \
    -e "IIP_CONFIG_DIR=${configdir}" \
    -e "IIP_CREDENTIAL_DIR=/home/ARC/.lsst" \
    -e "LSST_DDS_DOMAIN=auxtelpath" \
    -v /home/ARC/.lsst:/home/ARC/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstdm/atcontroller:salobj_v5.0.0_xml_v4.4.1-rc2
