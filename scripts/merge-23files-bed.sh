#!/bin/bash

# Takes a bunch of 23andMe formatted files and merges them into a single plink bed file.
# Usage: merge-23files-bed.sh *.23file.txt | bash

i=1
for F in "$@"; do
  CMD="plink --23file $F $F 1 0 --snps-only no-DI --out $F.23 --make-bed"
  echo $CMD
  if [ "$i" -eq 1 ]; then 
    FIRST="$F.23"
    echo "echo -n > tmp.mergelist.txt"
  fi
  if [ "$i" -gt 1 ]; then
    echo "echo $F.23 >> tmp.mergelist.txt"
  fi
  ((i+=1))
  echo
done

echo

echo "plink --bfile $FIRST --merge-list tmp.mergelist.txt --out merged"

echo "rm -f tmp.mergelist.txt*"