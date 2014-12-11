#!/bin/env python

import argparse
import gzip
import os.path
from warnings import warn

parser = argparse.ArgumentParser(description='Counts number of reads in a fastq file')
parser.add_argument('files', nargs='+', help=".fastq, .fq, .fastq.gz, or .fq.gz files")
args = parser.parse_args()

for f in args.files:
	if os.path.isfile(f):
		if f.endswith('.fq') or f.endswith('.fastq'):
			nreads = sum(1 for line in open(f))/4.0
		elif f.endswith('.fq.gz') or f.endswith('.fastq.gz'):
			nreads = sum(1 for line in gzip.open(f))/4.0
		else:
			print f + " must be a .fq, .fastq, .fq.gz, or .fastq.gz file"
			continue
		print f, nreads
	else:
		print f + " does not exist"
		continue
		
