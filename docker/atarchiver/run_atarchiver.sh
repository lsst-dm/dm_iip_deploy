#!/bin/bash
source $OSPL_HOME/release.com
source $HOME/atsetup.sh

run_at_archiver_csc.py &
pid="$!"

wait ${pid}
