#!/usr/bin/env bash
# sra2srr.sh
#
# Example
# -------
# To download all of the read archive files for SRP012001:
#   sra2srr.sh SRP012001 | while read srr; do prefetch $srr; done
#
# For 'esearch', 'efetch', 'xtract', you must install Entrez Direct:
#   http://www.ncbi.nlm.nih.gov/books/NBK179288/
#
# For 'prefetch', you must install SRA Tools:
#   https://github.com/ncbi/sra-tools
#
# From https://www.biostars.org/p/97782/#155024

SRA=$1
esearch -db sra -query $SRA | \
  efetch -format docsum | \
  xtract -pattern DocumentSummary -element Run@acc | \
  tr '\t' '\n'
