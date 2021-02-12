ARG DM_CSC_BASE_CONTAINER
FROM ts-dockerhub.lsst.org/lsstdm/base:${DM_CSC_BASE_CONTAINER}

WORKDIR /home/saluser
ARG DM_CCARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_CCArchiver && \
    cd dm_CCArchiver && \
    git checkout ${DM_CCARCHIVER_GIT}

COPY ccsetup.sh /home/saluser/ccsetup.sh
