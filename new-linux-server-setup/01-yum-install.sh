#!/bin/bash

## Get the latest EPEL release
yum update
yum install -y epel-release

## Essentials
yum install -y gcc-c++ vim git tmux screen htop tree cmake parallel pcre curl ncftp gnutls pigz mosh nfs-utils patch

## Some libraries you'll definitely need
yum -y install libcurl libcurl-devel libxml2 libxml2-devel libpng libpng-devel bzip2-devel openssl-devel cyrus-sasl-devel mysql-devel hdf5-devel libsodium-devel cairo-devel libX11 libX11-devel

## Samba
yum install -y samba samba-client samba-common

## Java
yum search java | grep '^java-'
## Just get the **JRE**
yum -y install java-1.8.0-openjdk
## Or the whole **JDK**
# yum -y install java-1.8.0-openjdk-devel

## On secure linux R can't execute out of /tmp, can't build packages from source. 
## Make a /Rtmp directory then when running R set the environment variable.
# mkdir /Rtmp && chmod 777 /Rtmp
# echo 'if (dir.exists("/Rtmp")) Sys.setenv(TMPDIR="/Rtmp")' >> .Rprofile