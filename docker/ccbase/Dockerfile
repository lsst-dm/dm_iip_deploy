ARG LSSTTS_DEPLOY_ENV_VERSION
FROM lsstts/base:${LSSTTS_DEPLOY_ENV_VERSION}

LABEL name="CCArchiver Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

USER root
RUN yum install -y which file

USER ARC
RUN source /home/ARC/miniconda3/bin/activate && \
    pip install pika redis pyyaml && \
    conda install conda-build

RUN chmod 777 /home/ARC

WORKDIR /home/ARC
ARG DM_CONFIG_CC_GIT
RUN git clone https://github.com/lsst-dm/dm_config_cc && \
    cd dm_config_cc && \
    git checkout ${DM_CONFIG_CC_GIT}

WORKDIR /home/ARC
ARG DM_CSC_BASE_GIT
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT}

WORKDIR /home/ARC
ARG DM_CCARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_CCArchiver && \
    cd dm_CCArchiver && \
    git checkout ${DM_CCARCHIVER_GIT}
