ARG CYCLE_TAG
FROM ts-dockerhub.lsst.org/deploy-sqre:${CYCLE_TAG}

ARG CTRL_OODS_GIT
LABEL name="OODS Runtime Environment" \
    vendor="LSST" \
    license="GPLv3" \
    ctrl_oods_git=$CTRL_OODS_GIT

USER root

COPY lsst-ts.repo /tmp/lsst-ts.repo

RUN cat /tmp/lsst-ts.repo >> /etc/yum.conf

USER root
RUN chmod 755 /home/saluser
RUN chmod 755 /home/lsst

WORKDIR /opt/lsst

ARG CTRL_OODS_GIT
RUN git clone https://github.com/lsst-dm/ctrl_oods && \
    cd /opt/lsst/ctrl_oods && \
    git checkout ${CTRL_OODS_GIT} && \
    chown -R lsst.lsst /opt/lsst/ctrl_oods

USER lsst

WORKDIR /home/lsst

RUN source /opt/lsst/software/stack/loadLSST.bash && \
    pip install asynctest && \
    setup sconsUtils && \
    setup utils && \
    setup -r /opt/lsst/ctrl_oods && \
    cd /opt/lsst/ctrl_oods && \
    scons

USER saluser
WORKDIR /home/saluser

COPY --chown=saluser:saluser setup.sh /home/saluser

ARG TS_DDSCONFIG_PACKAGE
RUN git clone --depth 1 --branch ${TS_DDSCONFIG_PACKAGE} http://github.com/lsst-ts/ts_ddsconfig

ENV LSST_DDS_QOS=file:///home/saluser/ts_ddsconfig/qos/QoS.xml
ENV OSPL_URI=file:///home/saluser/ts_ddsconfig/config/ospl-shmem.xml

ENTRYPOINT [ "/usr/bin/tail", "-f", "/dev/null" ]
