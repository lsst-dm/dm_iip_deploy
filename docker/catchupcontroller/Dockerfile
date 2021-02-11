ARG DM_CATCHUPARCHIVER_CONTAINER
FROM ts-dockerhub.lsst.org/lsstdm/catchuparchiver:${DM_CATCHUPARCHIVER_CONTAINER}

ENV PATH /home/arc/miniconda3/bin:$PATH
ENV PYTHONPATH $PYTHONPATH:/home/arc/dm_csc_base/python:/home/arc/dm_CatchupArchiver/python

CMD ["python", "/home/arc/dm_CatchupArchiver/python/lsst/dm/CatchupArchiver/catchup_controller.py"]
