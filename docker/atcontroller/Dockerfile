ARG DM_CSC_BASE_CONTAINER
FROM lsstts/atbase:${DM_CSC_BASE_CONTAINER}

ARG LSSTTS_DEPLOY_ENV_VERSION
LABEL name="ATController Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsstts_deploy_env=${LSSTTS_DEPLOY_ENV_VERSION}

COPY run_atcontroller.sh /home/saluser/run_atcontroller.sh

ENTRYPOINT ["/bin/bash", "/home/saluser/run_atcontroller.sh"]
