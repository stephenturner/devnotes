#!/bin/env python

# If you have a bunch of sequence files that look something like this:
# samp1_ACGTAC_R1.fastq.gz
# samp1_ACGTAC_R2.fastq.gz
# samp2_TCGATC_R1.fastq.gz
# samp2_TCGATC_R2.fastq.gz
# This script will remove the barcode from the filename.
# samp1_R1.fastq.gz
# samp1_R2.fastq.gz
# samp2_R1.fastq.gz
# samp2_R2.fastq.gz
# The script looks for 1 or more A,C,G,T between a _ and a _R. (Regex line 32)
# The script will print the rename commands. Pipe this output to |sh if you're happy with it.

import argparse, os, sys, re

# Function to check if a file exists. Use as 'type' when addding argument.
def is_valid_file(parser, arg):
    if not os.path.exists(arg):
        parser.error("The file %s does not exist!" % arg)
    else:
        return arg

# Get a list of files and check that they exist
parser = argparse.ArgumentParser(description="Rename sequence files removing barcode from filename. Pipe output to |sh")
parser.add_argument("files", nargs='+', type=lambda x: is_valid_file(parser, x))
args = parser.parse_args()

for filename in args.files:
    # Replace _ACTGACTG_R with _R. Ie, get rid of the barcodes. Also, get rid of --.
    newname = filename
    newname = re.sub("_[ACTG]+_R", "_R", newname)
    newname = re.sub("--", "-", newname)
    # If you 
    if filename!=newname:
        command="mv %s %s" % (filename, newname)
        print command
