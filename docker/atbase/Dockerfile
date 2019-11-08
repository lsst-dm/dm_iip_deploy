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

RUN mkdir /home/ARC/config && \
    mkdir /home/ARC/config/ncsa && \
    mkdir /home/ARC/config/tucson

COPY config/ncsa/atarchiver_config.yaml /home/ARC/config/ncsa/atarchiver_config.yaml
COPY config/tucson/atarchiver_config.yaml /home/ARC/config/tucson/atarchiver_config.yaml

WORKDIR /home/ARC
ARG DM_CONFIG_AT_VERSION
RUN git clone https://github.com/lsst-dm/dm_config_at && \
    cd dm_config_at && \
    git checkout tags/${DM_CONFIG_AT_VERSION}

WORKDIR /home/ARC
ARG DM_CSC_BASE_VERSION
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout tags/${DM_CSC_BASE_VERSION}

WORKDIR /home/ARC
ARG DM_ATARCHIVER_VERSION
RUN git clone https://github.com/lsst-dm/dm_ATArchiver && \
    cd dm_ATArchiver && \
    git checkout tags/${DM_ATARCHIVER_VERSION}
