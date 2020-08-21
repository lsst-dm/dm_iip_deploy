#!/bin/bash
source /home/arc/miniconda3/bin/activate
source $OSPL_HOME/release.com
# replace AUTO in General/NetworkInterfaceAddress to the given internet address or network interface name
# NETWORK_INTERFACE_ADDRESS is initialized as part of the docker container startup
python /home/arc/mod_ospl.py $OSPL_URI /tmp/ospl.xml $NETWORK_INTERFACE_ADDRESS
# point at the re-written ospl.xml file
export OSPL_URI=file:///tmp/ospl.xml
export PYTHONPATH=/home/arc/dm_csc_base/python:/home/arc/dm_CCArchiver/python:$PYTHONPATH
export PATH=/home/arc/dm_csc_base/bin:/home/arc/dm_CCArchiver/bin:$PATH
export DM_CCARCHIVER_DIR=/home/arc/dm_CCArchiver
export DM_CSC_BASE_DIR=/home/arc/dm_csc_base
export DM_CONFIG_CC_DIR=/home/arc/dm_config_cc
LOGPATH=/tmp/ospl_logs.$$
mkdir $LOGPATH
export OSPL_LOGPATH=$LOGPATH
export HOME=/tmp
run_cc_archiver_csc.py
