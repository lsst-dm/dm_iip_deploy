
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
        lsst_dds_interface=em2
    elif [ "$OPTARG" = "ncsa" ]; then
        ARCHIVE_SITE=$OPTARG
        lsst_dds_interface=p3p2
    else
        echo "argument must be summit or ncsa"
        exit 1
    fi;;
c) CONTAINER_VERSION=${OPTARG};;
esac
done

if [[ -z $LSST_DDS_PARTITION_PREFIX ]] || [[ -z $CONTAINER_VERSION ]]; then
    echo $error_msg
    exit 1
fi

unset LSST_DDS_RESPONSIVENESS_TIMEOUT


docker run \
    -d \
    -t \
    --network=host \
    --pid=host \
    --ipc=host \
    -u `id -u $ARCHIVE_USER`:`id - $ARCHIVE_USER` \
    -e "DOMAIN_ID=0" \
    -e "IIP_CONFIG_DIR=/home/$ARCHIVE_USER/config/$ARCHIVE_SITE" \
    -e "IIP_CREDENTIAL_DIR=/home/$ARCHIVE_USER/.lsst" \
    -e "LSST_DDS_PARTITION_PREFIX=$ARCHIVE_SITE" \
    -e "LSST_DDS_INTERFACE=$lsst_dds_interface" \
    -v $HOME/dm_iip_deploy/docker/etc:/home/$ARCHIVE_USER/ts_ddsconfig/config \
    -v /home/$ARCHIVE_USER/.lsst:/home/$ARCHIVE_USER/.lsst \
    -v /var/log/iip:/var/log/iip \
    -v /data:/data \
    -v /tmp/docker_tmp:/tmp \
    ts-dockerhub.lsst.org/lsstdm/ccarchiver:$container_version
