#!/bin/bash
source /home/arc/miniconda3/bin/activate
source $OSPL_HOME/release.com
export PYTHONPATH=/home/arc/dm_csc_base/python:/home/arc/dm_CatchupArchiver/python:$PYTHONPATH
export PATH=/home/arc/dm_csc_base/bin:/home/arc/dm_CatchupArchiver/bin:$PATH
export DM_CATCHUPARCHIVER_DIR=/home/arc/dm_CatchupArchiver
export DM_CSC_BASE_DIR=/home/arc/dm_csc_base
export DM_CONFIG_CATCHUP_DIR=/home/arc/dm_config_catchup
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export HOME=/tmp
run_catchup_archiver_csc.py
