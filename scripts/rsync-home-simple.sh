#!/bin/sh

# Assumes you are backing up your home directory to an external
# drive called "External" mounted at /Volumes.

CMD="time rsync -av --delete $HOME/ /Volumes/EXTERNAL/$USER/"
echo $CMD
$CMD
