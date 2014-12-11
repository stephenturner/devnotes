#!/usr/bin/env python

# Orig Nick Greenfield

"""
No dependency Python script for joining two FASTQ files.
"""
import argparse
import sys


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=("Join two FASTQ paired end reads files. "
                     "Note: Requires input files to be sorted."))
    parser.add_argument("fastq1", help="First input FASTQ.")
    parser.add_argument("fastq2", help="Second input FASTQ.")
    parser.add_argument("output_fastq", nargs="?",
                        help=("Output FASTQ file name (optional, "
                              "streams to STDOUT if missing."))
    parser.add_argument("--sep", default="NNNNN",
                        help=("Optional separator to override default (NNNNN)."))
    parser.add_argument("--strict", action="store_true",
                        help=("Enforce that the headers of the input "
                              "FASTQ files match until the first whitespace "
                              "delimited (e.g., a space)."))
    args = parser.parse_args()

    readlines = True
    f1 = open(args.fastq1, mode='r')
    f2 = open(args.fastq2, mode='r')
    ix = 0

    # Use 'G', which is in most Phred scores.
    # http://en.wikipedia.org/wiki/FASTQ_format
    phred_sep = "G" * len(args.sep)

    if args.output_fastq is None:
        f_out = sys.stdout
    else:
        f_out = open(args.output_fastq, mode='w')

    while readlines:
        f1_line = f1.readline()
        f2_line = f2.readline()

        if f1_line == "":
            readlines = False
            f1.close()
            f2.close()
            f_out.close()
            if f2_line != "":
                raise Exception("Input FASTQ files do not match in length.")
            continue

        if ix % 4 == 0:  # Header
            f_out.write(f1_line)
            if args.strict:
                if f1_line[0] != "@" or f2_line[0] != "@":
                    raise Exception("Invalid input FASTQ files.")
                if f1_line.strip().split(" ")[0] != f2_line.strip().split(" ")[0]:
                    raise Exception("Input FASTQ files do not share headers. "
                                    "Check and re-run w/o --strict.")
        elif (ix - 1) % 4 == 0:  # Sequence
            f_out.write(f1_line.strip() + args.sep + f2_line)
        elif (ix - 2) % 4 == 0:  # Separator
            f_out.write("+\n")
        else:
            f_out.write(f1_line.strip() + phred_sep + f2_line)

        ix += 1
