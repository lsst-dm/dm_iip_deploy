#!/bin/bash
source /home/ARC/miniconda3/bin/activate
source $OSPL_HOME/release.com
# replace AUTO in General/NetworkInterfaceAddress to the given internet address or network interface name
# NETWORK_INTERFACE_ADDRESS is initialized as part of the docker container startup
python /home/ARC/mod_ospl.py $OSPL_URI /tmp/ospl.xml $NETWORK_INTERFACE_ADDRESS
# point at the re-written ospl.xml file
export OSPL_URI=file:///tmp/ospl.xml
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
