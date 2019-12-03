ARG DM_CSC_RELEASE
FROM lsstdm/atbase:${DM_CSC_RELEASE}

LABEL name="ATController Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

COPY run_atcontroller.sh /home/ARC/run_atcontroller.sh

ENTRYPOINT ["/bin/bash", "/home/ARC/run_atcontroller.sh"]
