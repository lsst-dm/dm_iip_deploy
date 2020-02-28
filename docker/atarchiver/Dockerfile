ARG DM_CSC_BASE_VERSION
FROM lsstdm/atbase:${DM_CSC_BASE_VERSION}

LABEL name="ATArchiver CSC Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

COPY run_atarchiver.sh /home/ARC/run_atarchiver.sh

ENTRYPOINT ["/bin/bash", "/home/ARC/run_atarchiver.sh"]
