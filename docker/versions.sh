#!/bin/bash
#

# t&s base container version
export CYCLE_TAG="c0025"
export TS_DDSCONFIG_PACKAGE="v0.9.0"
export OPENSPLICE_VERSION="V6.10.4"

export LSST_DDS_RESPONSIVENESS_TIMEOUT="15s"

# redis and pika versions
export PIKA_VERSION=1.1.0
export REDIS_VERSION=3.5.3

# set all the git tags or tickets for the versions you want to use for the containers
export CTRL_OODS_GIT=tags/7.0.1
#
# remove the "tags/" or "tickets/"; these new values will be used to label containers
#
export CTRL_OODS_VERSION=${CTRL_OODS_GIT#*/}

# the OODS container is tagged with the OODS version and the version of the LSST stack the OODS uses

export OODS_CONTAINER_VERSION=${CTRL_OODS_VERSION}_${CYCLE_TAG}
export TEST_OODS_CONTAINER_VERSION=test_${OODS_CONTAINER_VERSION}
