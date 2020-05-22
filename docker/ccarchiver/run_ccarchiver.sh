#!/bin/bash
source /home/ARC/miniconda3/bin/activate
source $OSPL_HOME/release.com
export PYTHONPATH=/home/ARC/dm_csc_base/python:/home/ARC/dm_CCArchiver/python:$PYTHONPATH
export PATH=/home/ARC/dm_csc_base/bin:/home/ARC/dm_CCArchiver/bin:$PATH
export DM_CCARCHIVER_DIR=/home/ARC/dm_CCArchiver
export DM_CSC_BASE_DIR=/home/ARC/dm_csc_base
export DM_CONFIG_CC_DIR=/home/ARC/dm_config_cc
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export HOME=/tmp
run_cc_archiver_csc.py
