ARG OODS_VERSION
ARG LSST_STACK_VERSION

FROM lsstsqre/centos:${LSST_STACK_VERSION}

LABEL name="OODS Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

USER root

RUN groupadd ARCHIVE && \
    useradd -G ARCHIVE ARC

WORKDIR /opt/lsst

RUN git clone https://github.com/lsst-dm/ctrl_oods && \
    cd /opt/lsst/ctrl_oods && \
    git checkout tags/1.0.0-rc1 && \
    chown -R lsst.lsst /opt/lsst/ctrl_oods

COPY run_oods.sh /opt/lsst
RUN chmod a+rx /opt/lsst/run_oods.sh

USER lsst

RUN source /opt/lsst/software/stack/loadLSST.bash && \
    conda install -y redis-py && \
    setup -r /opt/lsst/ctrl_oods &&\
    cd /opt/lsst/ctrl_oods && \
    scons

USER ARC

ENTRYPOINT ["/bin/bash", "/opt/lsst/run_oods.sh"]
