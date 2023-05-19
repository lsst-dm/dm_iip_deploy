ARG CYCLE_TAG
FROM ts-dockerhub.lsst.org/deploy-sqre:${CYCLE_TAG}

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


USER root
RUN chmod 755 /home/saluser

WORKDIR /opt/lsst

COPY at_oods.yaml /opt/lsst
COPY cc_oods.yaml /opt/lsst
RUN chmod a+rx /opt/lsst/at_oods.yaml && \
    chown saluser.saluser /opt/lsst/at_oods.yaml && \
    chmod a+rx /opt/lsst/cc_oods.yaml && \
    chown saluser.saluser /opt/lsst/cc_oods.yaml

USER root
WORKDIR /opt/lsst

RUN source /opt/lsst/software/stack/loadLSST.bash && \
    pip install isort asynctest

USER saluser
WORKDIR /home/saluser

ARG TS_DDSCONFIG_PACKAGE
RUN git clone --depth 1 --branch ${TS_DDSCONFIG_PACKAGE} http://github.com/lsst-ts/ts_ddsconfig

ENV LSST_DDS_QOS=file:///home/saluser/ts_ddsconfig/qos/QoS.xml
ENV OSPL_URI=file:///home/saluser/ts_ddsconfig/config/ospl-shmem.xml

ENTRYPOINT [ "/usr/bin/tail", "-f", "/dev/null" ]
