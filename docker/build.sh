#!/bin/bash
#
# set all the git tags or tickets for the versions you want to use for the containers
export DM_CONFIG_AT_GIT=tags/1.0.0-rc10
export DM_ATARCHIVER_GIT=tickets/DM-23676
export DM_CSC_BASE_GIT=tickets/DM-23022
export CTRL_OODS_GIT=tickets/DM-23662
export DM_CONFIG_CC_GIT=tags/1.0.0-rc1
export DM_CCARCHIVER_GIT=tickets/DM-23022
export LSST_STACK_VERSION=7-stack-lsst_distrib-w_2020_07
export LSSTTS_DEPLOY_ENV_VERSION=salobj_v5.4.1_xml_v4.7.0
#
# remove the "tags/" or "tickets/"; these new values will be used to label containers
#
export DM_CONFIG_AT_VERSION=${DM_CONFIG_AT_GIT#*/}
export DM_ATARCHIVER_VERSION=${DM_ATARCHIVER_GIT#*/}
export DM_CSC_BASE_VERSION=${DM_CSC_BASE_GIT#*/}
export OODS_VERSION=${CTRL_OODS_GIT#*/}
export DM_CONFIG_CC_VERSION=${DM_CONFIG_CC_GIT#*/}
export DM_CCARCHIVER_VERSION=${DM_CCARCHIVER_GIT#*/}
# the OODS container is tagged with the OODS version and the version of the LSST stack the OODS uses
export OODS_CONTAINER_VERSION=${OODS_VERSION}-${LSST_STACK_VERSION#*-*-lsst_distrib-}
docker-compose build base atbase atarchiver atcontroller ccbase ccarchiver cccontroller oods

