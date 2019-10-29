#!/bin/bash
if [ -z $DM_IIP_DEPLOY_DIR ]; then
	echo "environment variable DM_IIP_DEPLOY_DIR must be set"
	exit 1
fi
if [ -z $1 ]; then
	echo "parameter for repo name is missing"
	exit 1
fi
DM_REPO_NAME=$1

if [ -z $2 ]; then
	echo "parameter for repo version is missing"
	exit 1
fi
export DM_REPO_VERSION=$2

if [ -z $3 ]; then
	echo "parameter for repo release is missing"
	exit 1
fi
export DM_REPO_RELEASE=$3

SPEC_FILE=`readlink -f $DM_IIP_DEPLOY_DIR/etc/specs/$1.spec`

HERE=$PWD
PID=$$
echo $PID
MY_BUILD_DIR=/tmp/build.$PID
mkdir -p $MY_BUILD_DIR
cd $MY_BUILD_DIR
mkdir -p BUILD BUILDROOT RPMS SOURCES SPECS  SRPMS
cp $SPEC_FILE SPECS
cd SOURCES
wget https://github.com/lsst-dm/${DM_REPO_NAME}/archive/${DM_REPO_VERSION}-${DM_REPO_RELEASE}.zip
cd ..
rpmbuild --define "_topdir `pwd`" --target noarch -ba SPECS/*spec
cp $MY_BUILD_DIR/RPMS/noarch/*rpm $HERE
cd $HERE
