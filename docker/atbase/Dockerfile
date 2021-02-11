ARG DM_CSC_BASE_CONTAINER
FROM ts-dockerhub.lsst.org/lsstdm/base:${DM_CSC_BASE_CONTAINER}

WORKDIR /home/saluser
ARG DM_ATARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_ATArchiver && \
    cd dm_ATArchiver && \
    git checkout ${DM_ATARCHIVER_GIT}

COPY atsetup.sh /home/saluser/atsetup.sh
