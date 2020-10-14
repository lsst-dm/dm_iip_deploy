#!/bin/bash
source $HOME/ccsetup.sh

run_cc_archiver_csc.py &
pid="$!"

wait ${pid}
