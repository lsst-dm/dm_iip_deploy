#!/bin/bash
source /home/arc/miniconda3/bin/activate
source $OSPL_HOME/release.com
export PYTHONPATH=/home/arc/dm_csc_base/python:/home/arc/dm_ATArchiver/python:$PYTHONPATH
export PATH=/home/arc/dm_csc_base/bin:/home/arc/dm_ATArchiver/bin:$PATH
export DM_CSC_BASE_DIR=/home/arc/dm_csc_base
export DM_ATARCHIVER_DIR=/home/arc/dm_ATArchiver
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export HOME=/tmp
run_atarchive_controller.py
