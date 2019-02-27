#!/bin/bash

# Get the latest EPEL release
yum update
yum install -y epel-release

# Essentials
yum install -y gcc-c++ vim git tmux htop tree cmake parallel pcre curl ncftp

# Some libraries you'll definitely need
yum -y install libcurl libcurl-devel libxml2 libxml2-devel libpng libpng-devel openssl-devel mysql-devel hdf5-devel

# Samba
yum install -y samba samba-client samba-common

# Needed for samtools.
yum -y install bzip2-devel
# If you get the libbz2.so.1.0 error, do this
# ln -s /usr/lib64/libbz.so /usr/lib64/libbz2.s.1.0

# Needed for various R packages (minfi, mixOmics, rgl)
yum -y install mesa-libGL mesa-libGL-devel mesa-libGLU mesa-libGLU-devel libX11 libX11-devel


# Java
yum search java | grep '^java-'
## Just get the **JRE**
yum -y install java-1.8.0-openjdk
## Or the whole **JDK**
# yum -y install java-1.8.0-openjdk-devel

# On secure linux R can't execute out of /tmp, can't build packages from source. Make a /Rtmp directory:
# mkdir /Rtmp
# Then when running R set the environment variable.
# echo 'if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")' >> .Rprofile