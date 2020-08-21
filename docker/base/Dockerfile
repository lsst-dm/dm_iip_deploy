FROM centos:7

ARG PYTHON_VERSION=3.7m
ARG CONDA_VERSION=4.5.4

ENV OSPL_HOME=/opt/OpenSpliceDDS/V6.9.0/HDE/x86_64.linux
ENV LSST_DDS_DOMAIN=citest
ENV PYTHON_BUILD_VERSION=${PYTHON_VERSION}
ENV PYTHON_BUILD_LOCATION=/home/arc/miniconda3

ARG TS_SALOBJ_VERSION
ARG TS_IDL_VERSION
ARG TS_XML_VERSION
LABEL ts_salobj_version=$TS_SALOBJ_VERSION \
      ts_idl_version=$TS_IDL_VERSION \
      ts_xml_version=$TS_XML_VERSION

USER root

RUN adduser -u 1004 -m -s /bin/bash arc

COPY lsst-ts.repo /tmp/lsst-ts.repo

RUN cat /tmp/lsst-ts.repo >> /etc/yum.conf && \
    yum install -y wget \
                   git \
                   make \
                   wget \
                   gcc-c++

ARG OPENSPLICE_VERSION
RUN yum install -y $OPENSPLICE_VERSION

COPY setup.sh /home/arc/setup.sh

RUN chown arc /home/arc/setup.sh

COPY mod_ospl.py /home/arc/mod_ospl.py
RUN chown arc /home/arc/mod_ospl.py

USER arc
WORKDIR /home/arc

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && chmod +x miniconda.sh && ./miniconda.sh -b

ARG TS_SALOBJ_VERSION
ARG TS_IDL_VERSION
ARG TS_XML_VERSION
ARG DDS_VERSION
RUN source ~/miniconda3/bin/activate && conda config --add channels conda-forge && conda install -c lsstts python=3.7 ts-dds=${DDS_VERSION} ts-salobj="${TS_SALOBJ_VERSION}" cython ts-idl="${TS_IDL_VERSION}"


RUN chmod 755 /home/arc

USER arc

