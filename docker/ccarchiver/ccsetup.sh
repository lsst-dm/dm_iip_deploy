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
source $OSPL_HOME/release.com

# note this was removed as part of sal 5/ts_salobj 6, and the transition to the new ospl-daemon mechanism
## replace AUTO in General/NetworkInterfaceAddress to the given internet address or network interface name
## NETWORK_INTERFACE_ADDRESS is initialized as part of the docker container startup
## replace 0 in Domain/Id to the given Id
## DOMAIN_ID is initialized as part of the docker container startup
# python /home/saluser/mod_ospl.py $OSPL_URI /tmp/ospl.xml $NETWORK_INTERFACE_ADDRESS $DOMAIN_ID
## point at the re-written ospl.xml file
#export OSPL_URI=file:///tmp/ospl.xml

export PYTHONPATH=/home/saluser/dm_csc_base/python:/home/saluser/dm_CCArchiver/python:$PYTHONPATH
export PATH=/home/saluser/dm_csc_base/bin:/home/saluser/dm_CCArchiver/bin:$PATH
export DM_CCARCHIVER_DIR=/home/saluser/dm_CCArchiver
export DM_CSC_BASE_DIR=/home/saluser/dm_csc_base
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export HOME=/tmp
export OSPL_URI=file:///home/saluser/ts_ddsconfig/config/ospl-shmem.xml
