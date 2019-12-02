export LSST_STACK_VERSION=7-stack-lsst_distrib-w_2019_45
export LSSTTS_DEPLOY_ENV_VERSION=salobj_v5.0.0_xml_v4.4.1
export DM_CONFIG_AT_VERSION=1.0.0-rc4
export DM_ATARCHIVER_VERSION=1.0.0-rc8
export DM_CSC_BASE_VERSION=1.0.0-rc7
export OODS_VERSION=1.0.0-rc1
export DM_CSC_RELEASE=1.0.0-rc2
docker-compose build base atbase atarchiver atcontroller oods
