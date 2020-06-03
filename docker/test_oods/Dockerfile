ARG LSST_STACK_VERSION
FROM lsstsqre/centos:${LSST_STACK_VERSION}

ARG LSST_STACK_VERSION
ARG CTRL_OODS_GIT
ARG DM_CSC_BASE_GIT
LABEL name="OODS Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    lsst_stack_version=$LSST_STACK_VERSION \
    ctrl_oods_git=$CTRL_OODS_GIT \
    dm_csc_base_git=$DM_CSC_BASE_GIT

USER root

COPY lsst-ts.repo /tmp/lsst-ts.repo

RUN cat /tmp/lsst-ts.repo >> /etc/yum.conf

RUN groupadd ARCHIVE && \
    useradd -G ARCHIVE ARC

USER root
RUN chmod 755 /home/ARC
RUN chmod 755 /home/lsst

WORKDIR /opt/lsst

ARG DM_CSC_BASE_GIT
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd /opt/lsst/dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT} && \
    chown -R lsst.lsst /opt/lsst/dm_csc_base
    

COPY at_oods.yaml /opt/lsst
COPY cc_oods.yaml /opt/lsst
RUN chmod a+rx /opt/lsst/at_oods.yaml && \
    chown lsst.lsst /opt/lsst/at_oods.yaml && \
    chmod a+rx /opt/lsst/cc_oods.yaml && \
    chown lsst.lsst /opt/lsst/cc_oods.yaml

USER lsst

WORKDIR /home/lsst

RUN source /opt/lsst/software/stack/loadLSST.bash && \
    pip install redis pika asynctest

USER ARC

CMD tail -f /dev/null
