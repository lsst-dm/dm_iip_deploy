#!/bin/bash
#
# set the ts_salobj, ts_idl, ts_xml versions
export TS_SALOBJ_VERSION="5.4.0"
export TS_IDL_VERSION="1.1.2"
export TS_XML_VERSION="4.7.0"

# set all the git tags or tickets for the versions you want to use for the containers
export DM_CONFIG_AT_GIT=tags/2.0.0
export DM_ATARCHIVER_GIT=tags/2.0.0
export DM_CSC_BASE_GIT=tags/2.0.0
export CTRL_OODS_GIT=tags/2.0.0
export DM_CONFIG_CC_GIT=tags/1.0.0-rc1
export DM_CCARCHIVER_GIT=tags/1.0.0-rc1
export LSST_STACK_VERSION=7-stack-lsst_distrib-w_2020_07
export LSSTTS_DEPLOY_ENV_VERSION=salobj_v${TS_SALOBJ_VERSION}_idl_v${TS_IDL_VERSION}_xml_v${TS_XML_VERSION}
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
docker tag lsstdm/oods:$OODS_CONTAINER_VERSION lsstdm/at-oods:$OODS_CONTAINER_VERSION
docker tag lsstdm/oods:$OODS_CONTAINER_VERSION lsstdm/cc-oods:$OODS_CONTAINER_VERSION
