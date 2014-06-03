#!/usr/bin/perl

# Converts illumina 1.5 to sanger
# http://seqanswers.com/forums/showthread.php?t=5210

use strict;
use warnings;

my $count = 0;
while (<>) {
    chomp;
    if ($count++ % 4 == 3) { tr/\x40-\xff\x00-\x3f/\x21-\xe0\x21/; }
    print "$_\n";
}
