ARG DM_CSC_BASE_CONTAINER
FROM ts-dockerhub.lsst.org/lsstdm/catchupbase:${DM_CSC_BASE_CONTAINER}

ARG LSSTTS_DEPLOY_ENV_VERSION
LABEL name="CatchupArchiver CSC Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsstts_deploy_env=${LSSTTS_DEPLOY_ENV_VERSION}

COPY run_catchuparchiver.sh /home/arc/run_catchuparchiver.sh

CMD ["/bin/bash", "/home/arc/run_catchuparchiver.sh"]
