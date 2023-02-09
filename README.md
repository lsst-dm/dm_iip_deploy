# How to start CSCs

## Launch opsl-daemon

You must specify the platform and device you wish to control when launching.
This sets up the correct networking interface for the ospl_daemon to use.

usage: cd docker;./launch_ospl_daemon.sh -p [summit|tucson] -d [comcam|auxtel]

## Starting OODS Services:

You must specify the platform and container version you wish to control when launching.

The scripts sets up the correct networking interface and configuration file for the archiver 
services to use.

## OODS

usage: bin/run_atoods.sh -p [summit|tucson] -c container_version

usage: bin/run_ccoods.sh -p [summit|tucson] -c container_version
