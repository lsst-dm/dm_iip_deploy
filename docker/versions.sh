#!/bin/bash
#

# t&s base container version
export CYCLE_TAG="c0027"
export TS_DDSCONFIG_PACKAGE="v0.10.1"
export OPENSPLICE_VERSION="V6.10.4"

export LSST_DDS_RESPONSIVENESS_TIMEOUT="15s"

# begin obs_lsst fix
export OBS_LSST_COMMIT_SHA=9a2aef638468174948983d3f4d5b5c0b1c687580
export ASTRO_METADATA_TRANSLATOR_COMMIT_SHA=83a23aef333369843b34c66ccb8a96d7b310fc59
# begin obs_lsst fix

# redis and pika versions
export PIKA_VERSION=1.1.0
export REDIS_VERSION=3.5.3

# set all the git tags or tickets for the versions you want to use for the containers
export CTRL_OODS_GIT=tags/7.3.2
export DM_IIP_DEPLOY_GIT=tags/7.4.3
#
# remove the "tags/" or "tickets/"; these new values will be used to label containers
#
export CTRL_OODS_VERSION=${CTRL_OODS_GIT#*/}
export DM_IIP_DEPLOY_VERSION=${DM_IIP_DEPLOY_GIT#*/}

# the OODS container is tagged with the OODS version and the version of the LSST stack the OODS uses

export OODS_CONTAINER_VERSION=c_${CTRL_OODS_VERSION}_d_${DM_IIP_DEPLOY_VERSION}_${CYCLE_TAG}
export TEST_OODS_CONTAINER_VERSION=test_${OODS_CONTAINER_VERSION}
