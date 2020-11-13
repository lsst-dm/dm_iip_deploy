#!/bin/bash
source $OSPL_HOME/release.com
source $HOME/ccsetup.sh

run_cc_archiver_csc.py &
pid="$!"

wait ${pid}
