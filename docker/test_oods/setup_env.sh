#!/bin/bash
mkdir /tmp/user_data
export EUPS_USERDATA=/tmp/user_data
source /opt/lsst/software/stack/loadLSST.bash
setup -j -r /opt/lsst/dm_csc_base
export HOME=/tmp
