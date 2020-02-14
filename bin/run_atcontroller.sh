#!/bin/bash
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
. /opt/lsst/dm_ATArchiver/bin/setup_atarchiver.sh
/opt/lsst/dm_ATArchiver/bin/run_atarchive_controller.py
