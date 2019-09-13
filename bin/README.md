# Description
This directory stores scripts for installing and setting up ATArchiver. The 
directory contains two types of scripts - `setup_*` and `install_*`.

## Install scripts
Scripts prepended with `install` directive are installation scripts and they
are used to install software and packages without regards to where they should
be installed.

## Setup scripts
Setup scripts are prepended with `setup`. They are used to create users, 
directories, setting up log files and permissions. Essentially, their role is 
to make up everything that CTRL_IIP software needs.

# Install
* On ATArchiver machine, run as `root`
```
    $ source setup.env
    $ ./setup_CtrlIIP.sh
    $ ./install_ATArchiver.sh
    $ rabbitmq-server # start rabbitmq-server. will change if Puppet controls
    $ redis-server # start redis
    $ ./setup_RabbitMQ.sh
```
* On Forwarder(DAQ) machine, run as `root`
```
    $ source setup.env
    $ ./setup_CtrlIIP.sh
    $ ./install_Forwarder.sh
```

## RPM vs Building from source
It is recommended to install packages via rpm rather than building from source.
Yet, C++ libraries that ctrl_iip software depend have outdated versions of rpm
or do not have any rpms in the @base or @epel-release. If we can find rpms in
the future `yum updates`, it is better to use rpm.

# Note
The `build` script which is the whole mixture of `setup` and `install` is not
provided because after installing the packages, RabbitMQ and Redis servers have
to be started for some `setup` scripts to work.

## Caveats
* C++ and DAQ library tar balls should be hosted on private network.
