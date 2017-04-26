#!/bin/bash

# Takes a bunch of 23andMe formatted files and merges them into a single plink bed file.
# Usage: merge-23files-bed.sh *.23file.txt | bash

echo "#!/bin/env bash"
echo
echo "# Create individual bed files:"
i=0
for F in "$@"; do
  CMD="plink --23file $F $F 1 0 --snps-only just-acgt --out $F.23 --make-bed"
  echo $CMD
  if [ "$i" -eq 0 ]; then 
    FIRST="$F.23"
    echo "echo -n > tmp.mergelist.txt"
  fi
  if [ "$i" -gt 0 ]; then
    echo "echo $F.23 >> tmp.mergelist.txt"
  fi
  ((i+=1))
  echo
done

echo
echo "# merge **$i** files:"
echo "plink --bfile $FIRST --merge-list tmp.mergelist.txt --out merge"

# echo "rm -f tmp.mergelist.txt*"