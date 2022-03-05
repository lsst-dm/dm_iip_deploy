ARG OODS_CONTAINER_VERSION
FROM ts-dockerhub.lsst.org/lsstdm/oods:${OODS_CONTAINER_VERSION}

COPY --chown=saluser:saluser ccoods.sh /home/saluser

USER saluser

ENTRYPOINT ["/bin/bash", "/home/saluser/ccoods.sh"]
