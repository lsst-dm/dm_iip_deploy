ARG DM_CSC_BASE_VERSION
FROM lsstdm/ccbase:${DM_CSC_BASE_VERSION}

LABEL name="CCArchiver CSC Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

COPY run_ccarchiver.sh /home/ARC/run_ccarchiver.sh

#ENTRYPOINT ["/bin/bash", "/home/ARC/run_ccarchiver.sh"]
