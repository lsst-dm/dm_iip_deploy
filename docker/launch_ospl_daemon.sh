#!/bin/bash
#
loc="`dirname \"$0\"`"
source $loc/versions.sh

error_msg="$0: missing argument: -p [summit|tucson|ncsa] -d [comcam|auxtel]"

source versions.sh

export ARCHIVE_SITE=
export ARCHIVE_DEVICE=

while getopts p:d: option
do
case "${option}"
in
p)
    if [ "$OPTARG" = "summit" ] || [ "$OPTARG" = "tucson" ] || [ "$OPTARG" = "ncsa"  ]; then
        ARCHIVE_SITE=$OPTARG
    else
        echo "-p argument must be 'summit', 'tucson' or 'ncsa'"
        exit 1
    fi;;
        
d)
    if [ "$OPTARG" = "comcam" ] || [ "$OPTARG" = "auxtel" ]; then
        ARCHIVE_DEVICE=$OPTARG
    else
        echo "-d argument must be comcam or auxtel"
        exit 1
    fi;;
        
esac
done

if [[ -z $ARCHIVE_SITE ]] || [[ -z $ARCHIVE_DEVICE ]]; then
    echo $error_msg
    exit 1
fi


export LSST_DDS_INTERFACE=

if [ "$ARCHIVE_SITE" = "summit" ]; then
    if [ "$ARCHIVE_DEVICE" = "comcam" ]; then
        LSST_DDS_INTERFACE=em2
    elif [ "$ARCHIVE_DEVICE" = "auxtel" ]; then
        LSST_DDS_INTERFACE=em2.1201
    fi
elif [ "$ARCHIVE_SITE" = "tucson" ]; then
        LSST_DDS_INTERFACE=dds
elif [ "$ARCHIVE_SITE" = "ncsa" ]; then
    if [ "$ARCHIVE_DEVICE" = "comcam" ]; then
        LSST_DDS_INTERFACE=p3p2
    elif [ "$ARCHIVE_DEVICE" = "auxtel" ]; then
        LSST_DDS_INTERFACE=p3p2
    fi
fi

export LSST_DDS_PARTITION_PREFIX=$ARCHIVE_SITE

docker-compose -f docker-compose-ospl.yml up -d ospl-daemon
