export LSST_STACK_VERSION=7-stack-lsst_distrib-w_2020_06
export LSSTTS_DEPLOY_ENV_VERSION=salobj_v5.0.0_xml_v4.4.1
export DM_CONFIG_AT_VERSION=1.0.0-rc9
export DM_ATARCHIVER_VERSION=1.0.0-rc10
export DM_CSC_BASE_VERSION=1.0.0-r9
export OODS_VERSION=1.0.0-rc3
export DM_CSC_RELEASE=1.0.0-rc2
export OODS_CP_VERSION=`echo $OODS_VERSION | cut -d"-" -f2`-`echo $LSST_STACK_VERSION | cut -d"-" -f4`
#docker-compose build base atbase atarchiver atcontroller oods
docker-compose build oods
