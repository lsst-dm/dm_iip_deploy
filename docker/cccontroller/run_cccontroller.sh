#!/bin/bash
source /opt/lsst/software/stack/miniconda/bin/activate
export PYTHONPATH=/home/saluser/dm_csc_base/python:/home/saluser/dm_CCArchiver/python:$PYTHONPATH
export PATH=/home/saluser/dm_csc_base/bin:/home/saluser/dm_CCArchiver/bin:$PATH
export DM_CSC_BASE_DIR=/home/saluser/dm_csc_base
export DM_CCARCHIVER_DIR=/home/saluser/dm_CCArchiver
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
run_ccarchive_controller.py
