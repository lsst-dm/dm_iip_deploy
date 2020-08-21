ARG LSSTTS_DEPLOY_ENV_VERSION
FROM lsstts/base:${LSSTTS_DEPLOY_ENV_VERSION}

ARG DM_CONFIG_CC_GIT
ARG DM_CSC_BASE_GIT
ARG DM_CCARCHIVER_GIT
LABEL name="CCArchiver Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    dm_config_cc_git=$DM_CONFIG_CC_GIT \
    dm_csc_base_git=$DM_CSC_BASE_GIT \
    dm_ccarchiver_git=$DM_CCARCHIVER_GIT

USER root
RUN yum install -y which file

USER arc
RUN source /home/arc/miniconda3/bin/activate && \
    pip install pika redis pyyaml && \
    conda install conda-build

RUN chmod 777 /home/arc

WORKDIR /home/arc
ARG DM_CONFIG_CC_GIT
RUN git clone https://github.com/lsst-dm/dm_config_cc && \
    cd dm_config_cc && \
    git checkout ${DM_CONFIG_CC_GIT}

WORKDIR /home/arc
ARG DM_CSC_BASE_GIT
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT}

WORKDIR /home/arc
ARG DM_CCARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_CCArchiver && \
    cd dm_CCArchiver && \
    git checkout ${DM_CCARCHIVER_GIT}
