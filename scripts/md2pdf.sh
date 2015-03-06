#!/bin/bash

# Uses pandoc to convert all the markdown documents in the CWD to PDF.

if [ "$#" -eq 0 ]; then
	echo "Usage: $0 <file1.md> [file2.md file3.md ...]"
	exit 1
fi
for md in "$@"
do
	CMD="pandoc -s -V geometry:margin=1in -V documentclass:article -V fontsize=12pt $md -o $md.pdf"
	echo $CMD
	$CMD
done
