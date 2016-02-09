#!/usr/bin/env bash

# usage: 
# source $(which pre-cmake.sh)
module load gcc cmake
export CC=$(which gcc)
export CXX=$(which g++)
echo "CC  set to $CC"
echo "CXX set to $CXX"
