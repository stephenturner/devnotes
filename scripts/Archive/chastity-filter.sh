#!/bin/sh

# Chastity filters illumina reads by grep'ing for 
# lines starting with @, then containing a :N:. 
# Prints out that line plus three lines that follow (-A 3).
# Last grep removes some leftover grep cruft.

# Print help if no arguments
help="Chastity filters illumina reads with grep -A 3 '^@.*[^:]*:N:[^:]*:'"
usage="Usage: $0 <unfiltered.fq>"
## is data coming in on a pipe?
if [ "$(tty)" == 'not a tty' ]
then
	PIPE=1
else
	PIPE=0
fi
## If no data on a pipe and no arguments then print help
if [[ $# -ne 1 && $PIPE -eq 0 ]] ; then
    echo -e "\n$help\n$usage\n" 
    exit 0
fi

# Do the filtering
cat $1 | grep -A 3 '^@.*[^:]*:N:[^:]*:' | grep -v '^\-\-$'
