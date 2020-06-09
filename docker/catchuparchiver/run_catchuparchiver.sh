#!/bin/bash
source /home/ARC/miniconda3/bin/activate
source $OSPL_HOME/release.com
export PYTHONPATH=/home/ARC/dm_csc_base/python:/home/ARC/dm_CatchupArchiver/python:$PYTHONPATH
export PATH=/home/ARC/dm_csc_base/bin:/home/ARC/dm_CatchupArchiver/bin:$PATH
export DM_CATCHUPARCHIVER_DIR=/home/ARC/dm_CatchupArchiver
export DM_CSC_BASE_DIR=/home/ARC/dm_csc_base
export DM_CONFIG_CATCHUP_DIR=/home/ARC/dm_config_catchup
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export HOME=/tmp
run_catchup_archiver_csc.py
