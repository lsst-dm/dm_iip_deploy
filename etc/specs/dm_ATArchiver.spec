%define lsstpath /opt/lsst/dm_ATArchiver
%define gitversion %{getenv:DM_REPO_VERSION}
%define gitrelease %{getenv:DM_REPO_RELEASE}
%define user root
%define _python_bytecompile_errors_terminate_build 0

Name:	dm_ATArchiver
Version: 1.0.0
Release: %{gitrelease}
Summary: ATArchiver CSC software package

Group:	LSST	
License: GPL
URL: http://www.lsst.org/
Source0:	https://github.com/lsst-dm/dm_ATArchiver/archive/%{gitversion}-%{gitrelease}.zip

BuildArch: noarch

%description
The ATARchiver CSC

%prep
%setup -q -n dm_ATArchiver-%{gitversion}-%{gitrelease}


%install
install -d %{buildroot}%{lsstpath}/bin 
install -d %{buildroot}%{lsstpath}/etc
install -d %{buildroot}%{lsstpath}/etc/config
install -d %{buildroot}%{lsstpath}/python 
install -d %{buildroot}%{lsstpath}/python/lsst
install -d %{buildroot}%{lsstpath}/python/lsst/dm
install -d %{buildroot}%{lsstpath}/python/lsst/dm/ATArchiver
install -d %{buildroot}%{lsstpath}/schema
install -d %{buildroot}%{lsstpath}/ups

install -m 755 -D bin/run_at_archiver_csc.py %{buildroot}%{lsstpath}/bin
install -m 755 -D bin/run_atarchive_controller.py %{buildroot}%{lsstpath}/bin
install -m 755 -D bin/run_atarchive_controller.sh %{buildroot}%{lsstpath}/bin
install -m 755 -D bin/run_atarchiver.sh %{buildroot}%{lsstpath}/bin
install -m 755 -D bin/setup_atarchiver.sh %{buildroot}%{lsstpath}/bin
install -m 755 -D etc/config/atarchiver_config.yaml %{buildroot}%{lsstpath}/etc/config
install -m 755 -D python/lsst/dm/ATArchiver/*py %{buildroot}%{lsstpath}/python/lsst/dm/ATArchiver
install -m 755 -D schema/* %{buildroot}%{lsstpath}/schema
install -m 755 -D ups/* %{buildroot}%{lsstpath}/ups


%files
%defattr(755, %{user}, %{user}, 755)
%{lsstpath}/bin/*
%{lsstpath}/etc/*
%{lsstpath}/python/*
%{lsstpath}/schema/*
%{lsstpath}/ups/*

%doc



%changelog

