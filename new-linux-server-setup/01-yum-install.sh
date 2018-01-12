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

# If you get the libbz2.so.1.0 error, do this
sudo yum -y install bzip2-devel

# Java
yum search java | grep '^java-'
## Just get the **JRE**
sudo yum -y install java-1.8.0-openjdk
## Or the whole **JDK**
# sudo yum -y install java-1.8.0-openjdk-devel

# R can't execute out of /tmp. Make a /Rtmp directory:
# sudo mkdir /Rtmp
# Then when running R set the environment variable.
echo 'if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")' >> .Rprofile