ARG DM_CSC_BASE_VERSION
FROM lsstts/catchupbase:${DM_CSC_BASE_VERSION}

ARG LSSTTS_DEPLOY_ENV_VERSION
LABEL name="CatchupArchiver CSC Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsstts_deploy_env=${LSSTTS_DEPLOY_ENV_VERSION}

COPY run_catchuparchiver.sh /home/arc/run_catchuparchiver.sh

ENTRYPOINT ["/bin/bash", "/home/arc/run_catchuparchiver.sh"]
