ARG LSSTTS_DEPLOY_ENV_VERSION
FROM lsstts/base:${LSSTTS_DEPLOY_ENV_VERSION}

WORKDIR /home/saluser
ARG DM_ATARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_ATArchiver && \
    cd dm_ATArchiver && \
    git checkout ${DM_ATARCHIVER_GIT}

COPY atsetup.sh /home/saluser/atsetup.sh
