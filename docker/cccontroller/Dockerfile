ARG DM_CSC_BASE_VERSION
FROM lsstdm/ccbase:${DM_CSC_BASE_VERSION}

LABEL name="CCController Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

COPY run_cccontroller.sh /home/ARC/run_cccontroller.sh

ENTRYPOINT ["/bin/bash", "/home/ARC/run_cccontroller.sh"]
