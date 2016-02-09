#!/bin/sh

# Writes an index.html file for all the files in the CWD, recursively

echo '<html><body>'
find . -type f -not -path '*/\.*' -not -name "index.html" | sed 's/^\.\///' | sed 's/^.*/<a href="&">&<\/a><br\/>/'
echo '</body></html>'
