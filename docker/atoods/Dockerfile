ARG CYCLE_TAG
FROM ts-dockerhub.lsst.org/oods:${CYCLE_TAG}


COPY --chown=saluser:saluser atoods.sh /home/saluser

USER saluser

ENTRYPOINT ["/bin/bash", "/home/saluser/atoods.sh"]
