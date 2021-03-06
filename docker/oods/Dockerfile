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

RUN groupadd -g 73006 saluser && \
    useradd -u 73006 -g saluser saluser

USER root
RUN chmod 755 /home/saluser
RUN chmod 755 /home/lsst

WORKDIR /opt/lsst

ARG CTRL_OODS_GIT
RUN git clone https://github.com/lsst-dm/ctrl_oods && \
    cd /opt/lsst/ctrl_oods && \
    git checkout ${CTRL_OODS_GIT} && \
    chown -R lsst.lsst /opt/lsst/ctrl_oods

ARG DM_CSC_BASE_GIT
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd /opt/lsst/dm_csc_base && \
    git checkout ${DM_CSC_BASE_GIT} && \
    chown -R lsst.lsst /opt/lsst/dm_csc_base
    

COPY run_oods.sh /opt/lsst
COPY oods.yaml /opt/lsst
RUN chmod a+rx /opt/lsst/run_oods.sh && \
    chmod a+rx /opt/lsst/oods.yaml

USER lsst

WORKDIR /home/lsst

RUN source /opt/lsst/software/stack/loadLSST.bash && \
    pip install redis pika asynctest && \
    setup sconsUtils && \
    setup utils && \
    setup -j -r /opt/lsst/dm_csc_base && \
    setup -r /opt/lsst/ctrl_oods && \
    cd /opt/lsst/ctrl_oods && \
    scons

USER saluser


ENTRYPOINT ["/bin/bash", "/opt/lsst/run_oods.sh"]
