FROM centos:7

ARG PYTHON_VERSION=3.7m
ARG CONDA_VERSION=4.5.4

ENV OSPL_HOME=/opt/OpenSpliceDDS/V6.9.0/HDE/x86_64.linux
ENV LSST_DDS_DOMAIN=citest
ENV PYTHON_BUILD_VERSION=${PYTHON_VERSION}
ENV PYTHON_BUILD_LOCATION=/home/ARC/miniconda3

USER root

RUN adduser -u 1004 -m -s /bin/bash ARC

COPY lsst-ts.repo /tmp/lsst-ts.repo

RUN cat /tmp/lsst-ts.repo >> /etc/yum.conf && \
    yum install -y wget \
                   git \
                   make \
                   wget \
                   gcc-c++ \
                   OpenSpliceDDS-6.9.0-1

COPY setup.sh /home/ARC/setup.sh

RUN chown ARC /home/ARC/setup.sh

USER ARC
WORKDIR /home/ARC

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && chmod +x miniconda.sh && ./miniconda.sh -b

ARG TS_SALOBJ_VERSION
ARG TS_IDL_VERSION
ARG TS_XML_VERSION
RUN source ~/miniconda3/bin/activate && conda config --add channels conda-forge && conda install -c lsstts python=3.7 ts-salobj="v${TS_SALOBJ_VERSION}" cython ts-idl="v${TS_IDL_VERSION}_${TS_XML_VERSION}"

RUN source ~/miniconda3/bin/activate && \
    source $OSPL_HOME/release.com && \
    mkdir dds && \
    cd dds && \
    tar xvzf /opt/OpenSpliceDDS/V6.9.0/HDE/x86_64.linux/tools/python-support.tgz && \
    cd python/src && \
    python setup.py install

RUN chmod 755 /home/ARC

USER ARC
