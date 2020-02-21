#!/bin/bash
source /home/ARC/miniconda3/bin/activate
source $OSPL_HOME/release.com
export PYTHONPATH=/home/ARC/dm_csc_base/python:/home/ARC/dm_ATArchiver/python:$PYTHONPATH
export PATH=/home/ARC/dm_csc_base/bin:/home/ARC/dm_ATArchiver/bin:$PATH
export DM_CSC_BASE_DIR=/home/ARC/dm_csc_base
export DM_ATARCHIVER_DIR=/home/ARC/dm_ATArchiver
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
run_atarchive_controller.py
