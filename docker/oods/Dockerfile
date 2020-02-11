ARG LSST_STACK_VERSION
FROM lsstsqre/centos:${LSST_STACK_VERSION}

LABEL name="OODS Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

USER root

RUN groupadd ARCHIVE && \
    useradd -G ARCHIVE ARC

USER root
RUN chmod 755 /home/ARC
RUN chmod 755 /home/lsst

WORKDIR /opt/lsst

ARG OODS_VERSION
RUN git clone https://github.com/lsst-dm/ctrl_oods && \
    cd /opt/lsst/ctrl_oods && \
    git checkout tags/${OODS_VERSION} && \
    chown -R lsst.lsst /opt/lsst/ctrl_oods

ARG DM_CSC_BASE_VERSION
RUN git clone https://github.com/lsst-dm/dm_csc_base && \
    cd /opt/lsst/dm_csc_base && \
    git checkout tags/${DM_CSC_BASE_VERSION} && \
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
    setup -r /opt/lsst/ctrl_oods && \
    setup -j -r /opt/lsst/dm_csc_base && \
    cd /opt/lsst/ctrl_oods && \
    scons

USER ARC


ENTRYPOINT ["/bin/bash", "/opt/lsst/run_oods.sh", "/opt/lsst/oods.yaml"]
