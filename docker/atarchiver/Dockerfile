ARG DM_CSC_RELEASE
FROM lsstdm/atbase:${DM_CSC_RELEASE}

LABEL name="ATArchiver CSC Runtime Environment" \
    vendor="LSST" \
    license="GPLv3"

COPY run_atarchiver.sh /home/saluser/run_atarchiver.sh

##ENTRYPOINT ["/bin/bash", "/home/saluser/run_atarchiver.sh"]

