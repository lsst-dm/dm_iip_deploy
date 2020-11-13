#!/bin/bash
export pid

pid=0

# SIGTERM-handler
term_handler() {
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers
# on callback, kill the last background process and execute term_handler
trap 'kill ${!}; term_handler' SIGTERM

source /opt/lsst/software/stack/miniconda/bin/activate

export DM_CSC_BASE_DIR=$HOME/dm_csc_base
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export OSPL_URI=file:///home/saluser/ts_ddsconfig/config/ospl-shmem.xml
