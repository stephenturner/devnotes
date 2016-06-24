#!/usr/bin/Rscript

# Reads an input SNP matrix in the form:
#
#           samp40  samp60  samp61  samp68  samp83  samp15
#   samp40  0       28      14      109     15      102
#   samp60  28      0       14      119     15      112
#   samp61  14      14      0       108     1       101
#   samp68  109     119     108     0       106     9
#   samp83  15      15      1       106     0       99
#   samp15  102     112     101     9       99      0
#
# And draws a neighbor-joining phylogenetic tree.
#
# Usage: drawtree.R <input-snp-matrix.tsv> ['optional plot title']


args <- commandArgs(trailingOnly=TRUE)
helpmsg <- "Usage: drawtree.R <input-snp-matrix.tsv> ['optional plot title']"
if (length(args)<1 | length(args)>2) stop(helpmsg)
infile <- args[1]
if (!file.exists(infile)) {
  stop(paste("Input file doesn't exist:", infile))
} else {
  message(paste("Input file found:", infile))
}

message("Creating tree...")
library(ape)
njtree <- nj(as.dist(as.matrix(read.delim(infile, row.names=1))))

message("Writing png...")
png(paste0(infile, ".njtree.png"), w=1100, h=850, pointsize=18)
plot(njtree, main=args[2])
x <- dev.off()

message("Writing pdf...")
pdf(paste0(infile, ".njtree.pdf"), w=11, h=8.5)
plot(njtree, main=args[2])
x <- dev.off()
