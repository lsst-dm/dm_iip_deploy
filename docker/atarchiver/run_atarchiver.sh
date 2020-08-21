#!/bin/bash
source /home/arc/miniconda3/bin/activate
source $OSPL_HOME/release.com
export PYTHONPATH=/home/arc/dm_csc_base/python:/home/arc/dm_ATArchiver/python:$PYTHONPATH
export PATH=/home/arc/dm_csc_base/bin:/home/arc/dm_ATArchiver/bin:$PATH
export DM_ATARCHIVER_DIR=/home/arc/dm_ATArchiver
export DM_CSC_BASE_DIR=/home/arc/dm_csc_base
export DM_CONFIG_AT_DIR=/home/arc/dm_config_at
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export HOME=/tmp
run_at_archiver_csc.py
