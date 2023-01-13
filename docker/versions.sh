#!/bin/bash
#

# t&s base container version
export CYCLE_TAG="c0028.004"
export TS_DDSCONFIG_PACKAGE="v0.10.1"
export OPENSPLICE_VERSION="V6.10.4"

export LSST_DDS_RESPONSIVENESS_TIMEOUT="15s"

# set all the git tags or tickets for the versions you want to use for the containers
export CTRL_OODS_GIT=tags/7.5.1
export DM_IIP_DEPLOY_GIT=tags/7.5.0
#
# remove the "tags/" or "tickets/"; these new values will be used to label containers
#
export CTRL_OODS_VERSION=${CTRL_OODS_GIT#*/}
export DM_IIP_DEPLOY_VERSION=${DM_IIP_DEPLOY_GIT#*/}

# the OODS container is tagged with the OODS version and the version of the LSST stack the OODS uses

export OODS_CONTAINER_VERSION=c_${CTRL_OODS_VERSION}_d_${DM_IIP_DEPLOY_VERSION}_${CYCLE_TAG}
export TEST_OODS_CONTAINER_VERSION=test_${OODS_CONTAINER_VERSION}
