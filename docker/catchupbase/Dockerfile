ARG LSSTTS_DEPLOY_ENV_VERSION

FROM lsstts/base:${LSSTTS_DEPLOY_ENV_VERSION}

ARG DM_CONFIG_CATCHUP_GIT
ARG DM_CSC_BASE_GIT
ARG DM_CATCHUPARCHIVER_GIT

LABEL name="CatchupArchiver Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    dm_config_catchup_git=$DM_CONFIG_CATCHUP_GIT \
    dm_csc_base_git=$DM_CSC_BASE_GIT \
    dm_catchuparchiver_git=$DM_CATCHUPARCHIVER_GIT

USER ARC
RUN source /home/ARC/miniconda3/bin/activate && \
    pip install pika redis pyyaml && \
    conda install conda-build

RUN chmod 777 /home/ARC

RUN git clone https://github.com/lsst-dm/dm_config_catchup && \
    cd dm_config_catchup && \
    git checkout ${DM_CONFIG_CATCHUP_GIT}

RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT}

RUN git clone https://github.com/lsst-dm/dm_CatchupArchiver && \
    cd dm_CatchupArchiver && \
    git checkout ${DM_CATCHUPARCHIVER_GIT}