ARG LSSTTS_DEPLOY_ENV_VERSION
FROM lsstts/base:${LSSTTS_DEPLOY_ENV_VERSION}

ARG DM_CSC_BASE_GIT
ARG DM_ATARCHIVER_GIT
LABEL name="ATArchiver Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsstts_deploy_env=${LSSTTS_DEPLOY_ENV_VERSION} \
    dm_csc_base_git=$DM_CSC_BASE_GIT \
    dm_atarchiver_git=$DM_ATARCHIVER_GIT

USER root
RUN yum install -y which file

ARG PIKA_VERSION
ARG REDIS_VERSION
USER arc
RUN source /home/arc/miniconda3/bin/activate && \
    pip install pika==$PIKA_VERSION && \
    pip install redis==$REDIS_VERSION && \
    conda install conda-build

RUN chmod 755 /home/arc

WORKDIR /home/arc
ARG DM_CSC_BASE_GIT
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT}

WORKDIR /home/arc
ARG DM_ATARCHIVER_GIT
RUN git clone https://github.com/lsst-dm/dm_ATArchiver && \
    cd dm_ATArchiver && \
    git checkout ${DM_ATARCHIVER_GIT}
