#!/bin/sh

# Every $1 seconds refreshes the screen to show the last $2 lines of history.
# Useful if you've got a split screen, teaching unix, and students can follow history.

#Ensure we have the quantity specified on the CLI
if [ -z "$2" ]; then ARG_ERR=ERR; fi
if [ -z "$1" ]; then ARG_ERR=ERR; fi
if [ -n "$ARG_ERR" ];
then
    echo "Usage: <sleeptimesecs> <numberoflines>"
    exit
fi

sleeptimesecs=$1
numberoflines=$2

# Tail history
while [ 1 ]; do
	clear
    tail -$numberoflines ~/.bash_history
    sleep $sleeptimesecs
done