#!/bin/bash
#
# t&s base container version
export CYCLE_TAG="c0016"

export TS_SALOBJ_VERSION="6.0.3"
export TS_DDSCONFIG_PACKAGE="v0.1.0"
export SITE_PREFIX="ncsa"
export OSPL_XML_FILE=etc/ospl-6.10.4-shmem.xml

export OPENSPLICE_VERSION="OpenSpliceDDS-6.10.4-5"
export DDS_VERSION="v6.9.190925_7"
# redis and pika versions
export PIKA_VERSION=1.1.0
export REDIS_VERSION=3.5.3

# set all the git tags or tickets for the versions you want to use for the containers
export DM_CSC_BASE_GIT=tags/4.1.0
#
export DM_ATARCHIVER_GIT=tags/4.0.0
#
export CTRL_OODS_GIT=tags/3.0.0
#
export DM_CCARCHIVER_GIT=tags/3.0.0
#
export DM_CONFIG_CATCHUP_GIT=master
export DM_CATCHUPARCHIVER_GIT=master
#
export LSST_STACK_VERSION=7-stack-lsst_distrib-w_2020_49
export LSSTTS_DEPLOY_ENV_VERSION=${CYCLE_TAG}
#
# remove the "tags/" or "tickets/"; these new values will be used to label containers
#
export DEPLOY_SUFFIX=${LSSTTS_DEPLOY_ENV_VERSION}
export DM_ATARCHIVER_VERSION=${DM_ATARCHIVER_GIT#*/}
export DM_CSC_BASE_VERSION=${DM_CSC_BASE_GIT#*/}
export OODS_VERSION=${CTRL_OODS_GIT#*/}
export DM_CCARCHIVER_VERSION=${DM_CCARCHIVER_GIT#*/}

export DM_CONFIG_CATCHUP_VERSION=${DM_CONFIG_CATCHUP_GIT#*/}
export DM_CATCHUPARCHIVER_VERSION=${DM_CATCHUPARCHIVER_GIT#*/}
# the OODS container is tagged with the OODS version and the version of the LSST stack the OODS uses
export DM_CSC_BASE_CONTAINER=${DM_CSC_BASE_VERSION}_${LSSTTS_DEPLOY_ENV_VERSION}

export DM_ATARCHIVER_CONTAINER=${DM_ATARCHIVER_VERSION}_base_${DM_CSC_BASE_VERSION}_${LSSTTS_DEPLOY_ENV_VERSION}
export DM_ATCONTROLLER_CONTAINER=${DM_ATARCHIVER_CONTAINER}

export DM_CCARCHIVER_CONTAINER=${DM_CCARCHIVER_VERSION}_base_${DM_CSC_BASE_VERSION}_${LSSTTS_DEPLOY_ENV_VERSION}
export DM_CCCONTROLLER_CONTAINER=${DM_CCARCHIVER_CONTAINER}

export DM_CATCHUPARCHIVER_CONTAINER=cu${DM_CATCHUPARCHIVER_VERSION}_base_${DM_CSC_BASE_VERSION}_${LSSTTS_DEPLOY_ENV_VERSION}
export DM_CATCHUPCONTROLLER_CONTAINER=${DM_CATCHUPARCHIVER_CONTAINER}

export OODS_CONTAINER_VERSION=${OODS_VERSION}-${LSST_STACK_VERSION#*-*-lsst_distrib-}
