%define lsstpath /opt/lsst/dm_config_at
%define gitversion %{getenv:DM_REPO_VERSION}
%define gitrelease %{getenv:DM_REPO_RELEASE}
%define user root

Name:		dm_config_at
Version:	1.0.0
Release:	%{gitrelease}
Summary:	configuration for dm_ATArchiver CSC

Group:		LSST
License:	GPL
URL:		http://www.lsst.org
Source0:	https://github.com/lsst/dm_config_at/archive/%{gitversion}-%{gitrelease}.zip

BuildArch: noarch

%description
Configuration information used by the salobj csc classes for dm_ATArchiver


%prep

%setup -q -n dm_config_at-%{gitversion}-%{gitrelease}


%build


%install
install -d %{buildroot}%{lsstpath}/ATArchiver %{buildroot}%{lsstpath}/ATArchiver/v1
install -d %{buildroot}%{lsstpath}/ups

install -m 755 -D ATArchiver/v1/normal.yaml %{buildroot}%{lsstpath}/ATArchiver/v1
install -m 755 -D ups/* %{buildroot}%{lsstpath}/ups


%files
%lsstpath/ATArchiver/v1/*
%lsstpath/ups/*

%doc



%changelog

