#!/bin/bash

docker run \
    -u `id -u ARC`:`id -g ARC` \
    --network=host \
    -e "IIP_CONFIG_DIR=/home/ARC/config" \
    -e "IIP_CREDENTIAL_DIR=/home/ARC/.lsst" \
    -e "LSST_DDS_DOMAIN=auxtelpath" \
    -v /home/ARC/config:/home/ARC/config \
    -v /home/ARC/.lsst:/home/ARC/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    lsstdm/atcontroller:1.0.0-rc11