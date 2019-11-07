#!/bin/bash
mkdir /tmp/user_data
export EUPS_USERDATA=/tmp/user_data
source /opt/lsst/software/stack/loadLSST.bash
setup -r /opt/lsst/ctrl_oods
oods.py
