#!/bin/bash
mkdir /tmp/user_data
export EUPS_USERDATA=/tmp/user_data
source /opt/lsst/software/stack/loadLSST.bash
setup -j -r /opt/lsst/dm_csc_base
setup -r /opt/lsst/ctrl_oods
#oods.py /opt/lsst/oods.yaml
export HOME=/tmp
oods.py $OODS_CONFIG_FILE
