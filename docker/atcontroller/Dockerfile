ARG DM_CSC_BASE_VERSION
FROM lsstts/atbase:${DM_CSC_BASE_VERSION}

LABEL name="ATController Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

COPY run_atcontroller.sh /home/ARC/run_atcontroller.sh

ENTRYPOINT ["/bin/bash", "/home/ARC/run_atcontroller.sh"]
