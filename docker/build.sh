export LSST_STACK_VERSION=7-stack-lsst_distrib-w_2020_06
export LSSTTS_DEPLOY_ENV_VERSION=salobj_v5.4.1_xml_v4.7.0
export DM_CONFIG_AT_VERSION=1.0.0-rc10
export DM_ATARCHIVER_VERSION=1.0.0-rc11
export DM_CSC_BASE_VERSION=1.0.0-rc11
export OODS_VERSION=1.0.0-rc3
export OODS_CP_VERSION=`echo $OODS_VERSION | cut -d"-" -f2`-`echo $LSST_STACK_VERSION | cut -d"-" -f4`
export DM_CONFIG_CC_VERSION=DM-23022
export DM_CCARCHIVER_VERSION=DM-23022
#docker-compose build base atbase atarchiver atcontroller ccbase ccarchiver cccontroller oods
docker-compose build base ccbase ccarchiver cccontroller
#docker-compose build base
