ARG DM_CSC_BASE_VERSION
FROM lsstts/atbase:${DM_CSC_BASE_VERSION}

ARG LSSTTS_DEPLOY_ENV_VERSION
LABEL name="ATArchiver CSC Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsstts_deploy_env=$LSSTTS_DEPLOY_ENV_VERSION

COPY run_atarchiver.sh /home/ARC/run_atarchiver.sh

ENTRYPOINT ["/bin/bash", "/home/ARC/run_atarchiver.sh"]
