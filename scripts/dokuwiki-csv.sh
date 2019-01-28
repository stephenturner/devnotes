#!/bin/bash

# Takes comma delimited data and converts to dokuwiki table format.
# https://www.dokuwiki.org/wiki:syntax

# sample1,value4
# sample2,value5
# sample3,value6

# |sample1|value4|
# |sample2|value5|
# |sample3|value6|

if [ "$(uname -s)" == "Darwin" ] # If the system is Mac OS X
then
   mysed="gsed"
else
   mysed="sed"
fi

cat $1 | $mysed 's/,/|/g'  | $mysed 's/^\(.*\)$/|\1|/g' | $mysed '1 s/|/^/g'
