#!/bin/bash
#
# set the ts_salobj, ts_idl, ts_xml versions
export TS_SALOBJ_VERSION="5.15.0"
export TS_IDL_VERSION="1.2.2_4.1.1"
export TS_XML_VERSION="6.0.0"

export OPENSPLICE_VERSION="OpenSpliceDDS-6.9.0-7"
export DDS_VERSION="v6.9.190925_7"
# set an alias for this combination

# set all the git tags or tickets for the versions you want to use for the containers
export DM_CSC_BASE_GIT=tags/2.1.1
#
export DM_CONFIG_AT_GIT=tags/2.0.0
export DM_ATARCHIVER_GIT=tags/2.1.1
#
export CTRL_OODS_GIT=tags/2.2.0
#
export DM_CONFIG_CC_GIT=tags/1.0.0-rc1
export DM_CCARCHIVER_GIT=tags/1.1.1
#
export DM_CONFIG_CATCHUP_GIT=tickets/DM-24077
export DM_CATCHUPARCHIVER_GIT=tickets/DM-24077
#
export LSST_STACK_VERSION=7-stack-lsst_distrib-w_2020_25
export LSSTTS_DEPLOY_ENV_VERSION=salobj_${TS_SALOBJ_VERSION}_idl_${TS_IDL_VERSION}_xml_${TS_XML_VERSION}
#
# remove the "tags/" or "tickets/"; these new values will be used to label containers
#
export DEPLOY_SUFFIX=${LSSTTS_DEPLOY_ENV_VERSION}
export DM_CONFIG_AT_VERSION=${DM_CONFIG_AT_GIT#*/}
export DM_ATARCHIVER_VERSION=${DM_ATARCHIVER_GIT#*/}
export DM_CSC_BASE_VERSION=${DM_CSC_BASE_GIT#*/}
export OODS_VERSION=${CTRL_OODS_GIT#*/}
export DM_CONFIG_CC_VERSION=${DM_CONFIG_CC_GIT#*/}
export DM_CCARCHIVER_VERSION=${DM_CCARCHIVER_GIT#*/}

export DM_CONFIG_CATCHUP_VERSION=${DM_CONFIG_CATCHUP_GIT#*/}
export DM_CATCHUPARCHIVER_VERSION=${DM_CATCHUPARCHIVER_GIT#*/}
# the OODS container is tagged with the OODS version and the version of the LSST stack the OODS uses
export DM_CSC_BASE_CONTAINER=${DM_CSC_BASE_VERSION}_${LSSTTS_DEPLOY_ENV_VERSION}

export DM_ATARCHIVER_CONTAINER=${DM_ATARCHIVER_VERSION}_${LSSTTS_DEPLOY_ENV_VERSION}
export DM_ATCONTROLLER_CONTAINER=${DM_ATARCHIVER_CONTAINER}

export DM_CCARCHIVER_CONTAINER=${DM_CCARCHIVER_VERSION}_${LSSTTS_DEPLOY_ENV_VERSION}
export DM_CCCONTROLLER_CONTAINER=${DM_CCARCHIVER_CONTAINER}

export OODS_CONTAINER_VERSION=${OODS_VERSION}-${LSST_STACK_VERSION#*-*-lsst_distrib-}
