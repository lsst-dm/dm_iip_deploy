#!/bin/bash
source /home/ARC/miniconda3/bin/activate
source $OSPL_HOME/release.com
export PYTHONPATH=/home/ARC/dm_csc_base/python:/home/ARC/dm_CCArchiver/python:$PYTHONPATH
export PATH=/home/ARC/dm_csc_base/bin:/home/ARC/dm_CCArchiver/bin:$PATH
export DM_CSC_BASE_DIR=/home/ARC/dm_csc_base
export DM_CCARCHIVER_DIR=/home/ARC/dm_CCArchiver
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
run_ccarchive_controller.py
