ARG CYCLE_TAG
FROM ts-dockerhub.lsst.org/deploy-env:${CYCLE_TAG}

ENV OSPL_HOME=/opt/OpenSpliceDDS/V6.10.4/HDE/x86_64.linux

ARG DM_CSC_BASE_GIT
LABEL name="CCArchiver Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    dm_csc_base_git=$DM_CSC_BASE_GIT \
    ts_ddsconfig_package=$TS_DDSCONFIG_PACKAGE

USER root
RUN yum install -y which file
RUN yum install -y net-tools

ARG PIKA_VERSION
ARG REDIS_VERSION
USER saluser
RUN source /opt/lsst/software/stack/miniconda/bin/activate && \
    pip install pika==$PIKA_VERSION && \
    pip install redis==$REDIS_VERSION && \
    conda install conda-build

RUN chmod 777 /home/saluser

WORKDIR /home/saluser
ARG DM_CSC_BASE_GIT
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT}

ARG TS_DDSCONFIG_PACKAGE
RUN git clone --depth 1 --branch ${TS_DDSCONFIG_PACKAGE} http://github.com/lsst-ts/ts_ddsconfig

ENV LSST_DDS_QOS=file:///home/saluser/ts_dds_config/qos/QoS.xml
ENV OSPL_URI=file:///home/saluser/ts_ddsconfig/config/ospl-shmem.xml


COPY setup.sh /home/saluser/setup.sh

COPY config /home/saluser/config/
