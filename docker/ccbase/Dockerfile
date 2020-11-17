ARG LSSTTS_DEPLOY_ENV_VERSION
FROM lsstts/base:${LSSTTS_DEPLOY_ENV_VERSION}

WORKDIR /home/saluser
ARG DM_CCARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_CCArchiver && \
    cd dm_CCArchiver && \
    git checkout ${DM_CCARCHIVER_GIT}

COPY ccsetup.sh /home/saluser/ccsetup.sh
