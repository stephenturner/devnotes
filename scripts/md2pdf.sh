#!/bin/bash

# Use pandoc to convert markdown files to PDF

# Set default pandoc options
PANDOCOPTS=""

# parse the options
while getopts 'o:' opt ; do
  case $opt in
    o) PANDOCOPTS=$OPTARG ;;
  esac
done

# skip over the processed options
shift $((OPTIND-1))

# check for mandatory positional parameters
if [ $# -eq 0 ]; then
  echo "Usage: $0 [options] <file1.md> [file2.md file3.md ...]"
  echo "Options: -o '--options --passed --to --pandoc'"
  exit 1
fi

# Create a pdf file for each markdown file
for md in "$@"
do
  CMD="pandoc -s -V geometry:margin=1in -V documentclass:article -V fontsize=11pt $PANDOCOPTS $md -o $md.pdf"
  echo $CMD
  $CMD
done
