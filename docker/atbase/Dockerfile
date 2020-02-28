ARG LSSTTS_DEPLOY_ENV_VERSION
FROM lsstdm/base:${LSSTTS_DEPLOY_ENV_VERSION}

LABEL name="ATArchiver Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

USER root
RUN yum install -y which file

USER ARC
RUN source /home/ARC/miniconda3/bin/activate && \
    pip install pika redis pyyaml && \
    conda install conda-build

RUN chmod 755 /home/ARC

WORKDIR /home/ARC
ARG DM_CONFIG_AT_GIT
RUN git clone https://github.com/lsst-dm/dm_config_at && \
    cd dm_config_at && \
    git checkout ${DM_CONFIG_AT_GIT}

WORKDIR /home/ARC
ARG DM_CSC_BASE_GIT
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT}

WORKDIR /home/ARC
ARG DM_ATARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_ATArchiver && \
    cd dm_ATArchiver && \
    git checkout ${DM_ATARCHIVER_GIT}
