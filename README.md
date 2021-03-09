# How to start CSCs

## first launch opsl-daemon.sh

You must specify the platform and device you wish to control when launching.
This sets up the correct networking interface for the ospl_daemon to use.

usage: bin/launch_ospl_daemon.sh -p [summit|ncsa] -d [comcam|auxtel]
example: bin/launch_ospl_daemon.sh -p ncsa -d auxtel

## Starting Archiving Services:

You must specify the platform and container version you wish to control when launching.

Each archiver consists of two services, the archiver CSC and a companion service which 
is used to coordinate files sent by the Forwarder and sent to the OODS.

The scripts sets up the correct networking interface and configuration file for the archiver 
services to use.

## AuxTel:

usage: bin/run_atarchiver.sh -p [summit|ncsa] -c container_version
example: bin/run_atarchiver.sh -p ncsa -c 4.1.0_base_4.1.0_c0017

usage: bin/run_atcontroller.sh -p ncsa -c container_version
example: bin/run_atcontroller.sh -p ncsa -c 4.1.0_base_4.1.0_c0017

## ComCam:

usage: bin/run_ccarchiver.sh -p [summit|ncsa] -c container_version
example: bin/run_ccatarchiver.sh -p ncsa -c 3.1.0_base_4.1.0_c0017

usage: bin/run_cccontroller.sh -p ncsa -c container_version
example: bin/run_cccontroller.sh -p ncsa -c 3.1.0_base_4.1.0_c0017
