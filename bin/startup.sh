#!/bin/bash
# get the directory from which this script was executed
loc=$(dirname -- "$(realpath -- "$0")")  
# get full path of directory above the directory were the script is executed
root_dir=$(dirname -- "$(realpath -- "$loc")")
source $root_dir/docker/versions.sh

while getopts p: option
do
case "${option}"
in
p)
    if [ "$OPTARG" = "summit" ]; then
       RUN_SITE=$OPTARG
    elif [ "$OPTARG" = "tucson" ]; then
       RUN_SITE=$OPTARG
    elif [ "$OPTARG" = "ncsa" ]; then
       RUN_SITE=$OPTARG
    else
        echo "-p argument must be 'summit', 'tucson' or 'ncsa'"
        exit 1
    fi;;
esac
done

echo $root_dir/bin/run_atoods.sh -p $RUN_SITE -c $OODS_CONTAINER_VERSION
echo $root_dir/bin/run_ccoods.sh -p $RUN_SITE -c $OODS_CONTAINER_VERSION
echo $root_dir/bin/run_atcontroller.sh -p $RUN_SITE -c $DM_ATARCHIVER_CONTAINER
echo $root_dir/bin/run_cccontroller.sh -p $RUN_SITE -c $DM_CCARCHIVER_CONTAINER
echo $root_dir/bin/run_atarchiver.sh -p $RUN_SITE -c $DM_ATCONTROLLER_CONTAINER
echo $root_dir/bin/run_ccarchiver.sh -p $RUN_SITE -c $DM_CCCONTROLLER_CONTAINER

