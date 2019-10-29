%define lsstpath /opt/lsst/dm_csc_base
%define gitversion %{getenv:DM_REPO_VERSION}
%define gitrelease %{getenv:DM_REPO_RELEASE}
%define user root
%define _python_bytecompile_errors_terminate_build 0

Name:	dm_csc_base
Version: 1.0.0
Release: %{gitrelease}
Summary: ATArchiver CSC software package

Group:	LSST	
License: GPL
URL: http://www.lsst.org/
Source0:	https://github.com/lsst-dm/dm_csc_base/archive/%{gitversion}-%{gitrelease}.zip

BuildArch: noarch

%description
The DM CSC support classes

%prep
%setup -q -n dm_csc_base-%{gitversion}-%{gitrelease}


%install
install -d %{buildroot}%{lsstpath}/bin 
install -d %{buildroot}%{lsstpath}/python 
install -d %{buildroot}%{lsstpath}/python/lsst
install -d %{buildroot}%{lsstpath}/python/lsst/dm
install -d %{buildroot}%{lsstpath}/python/lsst/dm/csc
install -d %{buildroot}%{lsstpath}/python/lsst/dm/csc/base
install -d %{buildroot}%{lsstpath}/ups

install -m 755 -D python/lsst/dm/csc/base/*py %{buildroot}%{lsstpath}/python/lsst/dm/csc/base
install -m 755 -D bin/csc_command.py %{buildroot}%{lsstpath}/bin
install -m 755 -D ups/* %{buildroot}%{lsstpath}/ups


%files
%defattr(755, %{user}, %{user}, 755)
%{lsstpath}/bin/*
%{lsstpath}/python/*
%{lsstpath}/ups/*

%doc



%changelog

