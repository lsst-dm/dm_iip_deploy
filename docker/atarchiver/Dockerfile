ARG DM_CSC_BASE_CONTAINER
FROM ts-dockerhub.lsst.org/lsstdm/atbase:${DM_CSC_BASE_CONTAINER}

ARG LSSTTS_DEPLOY_ENV_VERSION
LABEL name="ATArchiver CSC Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsstts_deploy_env=$LSSTTS_DEPLOY_ENV_VERSION

COPY run_atarchiver.sh /home/saluser/run_atarchiver.sh

ENTRYPOINT ["/bin/bash", "/home/saluser/run_atarchiver.sh"]
