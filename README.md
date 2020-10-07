# dm_iip_deploy
deployment and system scripts used by IIP


$DM_IIP_DEPLOY/bin/build_rpm.sh dm_csc_base 1.0.0 rc1

$DM_IIP_DEPLOY/bin/build_rpm.sh dm_ATArchiver 1.0.0 rc1

## How to run Commandable SAL Components(CSC)

### CatchupArchiver
``$ LSST_DDS_PARTITION_PREFIX=ncsa docker-compose run -u `id -u` catchuparchiver``
