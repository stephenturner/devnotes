#!/bin/sh

# Writes an index.html file for all the files in the CWD, recursively

out="index.html"

echo '<html><body>' > $out
find . -type f | grep -v "^\.$" | grep -v "index.html" | sed 's/^\.\///' | sed 's/^.*/<a href="&">&<\/a><br\/>/' >> $out
echo '</body></html>' >> $out
