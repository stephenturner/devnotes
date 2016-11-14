#!/bin/bash

# Extracts SNPs with rs numbers from an iScan FinalReport file.
# Assumes first 10 lines are a header. 

# Check extension, get the right cat/zcat
if [[ $1 == *.txt ]]
then
	CAT="cat"
elif [[ $1 == *txt.gz ]]
then
	CAT="gzip -dc"
else
	echo "ERROR on file $1"
	echo "File extension must be .txt or .txt.gz"
	exit 1
fi

# Check that the file exists
if [ ! -f $1 ]
then
	echo "ERROR on file $1"
	echo "File not found."
	exit 1
fi

# Check that the first line is [Header]
LINE1="$($CAT $1 | head -n 1)"
if [[ ! "$LINE1" =~ ^\[Header\] ]]
then
	echo "ERROR on file $1"
	echo "First line of file should be only: '[Header]'."
	echo "First line of file is actually:"
	echo $LINE1
	exit 1
fi

# cat the header and grep out any rs-numbered SNPs
cat <(head -n 10 $1) <(tail -n +11 $1 | grep rs)

