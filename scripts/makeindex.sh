#!/bin/sh

# Writes an index.html file for all the files in the CWD, recursively

echo '<html><body>'
find . -type f | grep -v "^\.$" | grep -v "index.html" | sed 's/^\.\///' | sed 's/^.*/<a href="&">&<\/a><br\/>/'
echo '</body></html>'
