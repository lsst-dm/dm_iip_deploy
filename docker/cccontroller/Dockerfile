ARG DM_CSC_BASE_CONTAINER
FROM lsstts/ccbase:${DM_CSC_BASE_CONTAINER}

ARG LSSTTS_DEPLOY_ENV_VERSION
LABEL name="CCController Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsstts_deploy_env=${LSSTTS_DEPLOY_ENV_VERSION}

COPY run_cccontroller.sh /home/arc/run_cccontroller.sh

ENTRYPOINT ["/bin/bash", "/home/arc/run_cccontroller.sh"]
