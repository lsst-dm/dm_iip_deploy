#!/bin/bash
export OSPL_LOGPATH=/tmp/ospl_logs.$$
mkdir $OSPL_LOGPATH

export OSPL_HOME=/opt/OpenSpliceDDS/V6.10.4/HDE/x86_64.linux

source $OSPL_HOME/release.com
source /opt/lsst/software/stack/loadLSST.bash
setup -r /opt/lsst/ctrl_oods
