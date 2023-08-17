ARG CYCLE_TAG
FROM ts-dockerhub.lsst.org/oods:${CYCLE_TAG}

COPY --chown=saluser:saluser mtoods.sh /home/saluser

USER saluser

ENTRYPOINT ["/bin/bash", "/home/saluser/mtoods.sh"]
