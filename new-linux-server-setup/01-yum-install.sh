#!/bin/bash

# Get the latest EPEL release
sudo yum update
sudo yum install -y epel-release

# Essentials
sudo yum install -y git tmux htop tree cmake parallel pcre environment-modules 

# Some libraries you'll definitely need
sudo yum -y install curl
sudo yum -y install libcurl libcurl-devel
sudo yum -y install libxml2 libxml2-devel
sudo yum -y install libpng  libpng-devel
sudo yum -y install openssl-devel
sudo yum -y install mysql-devel

# Needed for various R packages (minfi, mixOmics, rgl)
sudo yum -y install mesa-libGL mesa-libGL-devel
sudo yum -y install mesa-libGLU mesa-libGLU-devel
sudo yum -y install libX11 libX11-devel

# Needed for samtools.
sudo yum -y install bzip2-devel
# If you get the libbz2.so.1.0 error, do this
# sudo ln -s /usr/lib64/libbz.so /usr/lib64/libbz2.s.1.0


# Java
yum search java | grep '^java-'
## Just get the **JRE**
sudo yum -y install java-1.8.0-openjdk
## Or the whole **JDK**
# sudo yum -y install java-1.8.0-openjdk-devel

# R can't execute out of /tmp, can't build packages from source. Make a /Rtmp directory:
# sudo mkdir /Rtmp
# Then when running R set the environment variable.
echo 'if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")' >> .Rprofile