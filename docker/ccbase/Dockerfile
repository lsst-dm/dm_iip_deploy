ARG LSSTTS_DEPLOY_ENV_VERSION
FROM lsstdm/base:${LSSTTS_DEPLOY_ENV_VERSION}

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
ARG DM_CONFIG_CC_VERSION
#RUN git clone https://github.com/lsst-dm/dm_config_cc && \
#    cd dm_config_cc && \
#    git checkout tickets/${DM_CONFIG_CC_VERSION}
RUN git clone https://github.com/lsst-dm/dm_config_cc

WORKDIR /home/ARC
ARG DM_CSC_BASE_VERSION
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout tags/${DM_CSC_BASE_VERSION}

WORKDIR /home/ARC
ARG DM_CCARCHIVER_VERSION
RUN git clone https://github.com/lsst-dm/dm_CCArchiver && \
    cd dm_CCArchiver && \
    git checkout tickets/${DM_CCARCHIVER_VERSION}
