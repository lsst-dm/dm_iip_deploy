#!/bin/bash
export DM_CONFIG_AT_DIR=/home/saluser/dm_config_at
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
run_at_archiver_csc.py
