%define debug_package %{nil}

Name: 		git-prompt-autoenable
Version: 	0.1
Release:	0%{?dist}
Summary: 	enable git-prompt by default with include and exclude lists
BuildArch: 	noarch

Group:		ETN
License:	GPL
#URL:		
Source0: 	%{name}-%{version}.tar.gz
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

#BuildRequires:
#Requires:


%description
no description


%prep
%setup -q


%build


%install
rm -rf $RPM_BUILD_ROOT

#shopt -s nullglob

make install DESTDIR=$RPM_BUILD_ROOT
find $RPM_BUILD_ROOT


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)

%doc README.md
%doc dot.git-prompt-dirs.list
%doc dot.git-prompt-dirs-excludes.list

%config(noreplace) %attr(640,root,root) /etc/profile.d/git-prompt*
%config(noreplace) %attr(640,root,root) /etc/git-prompt.conf
/usr/bin/git-prompt*.sh


%changelog
