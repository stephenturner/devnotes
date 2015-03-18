#!/bin/env perl
#
#  This script was developed by Robin Barker (Robin.Barker@npl.co.uk),
#  from Larry Wall's original script eg/rename from the perl source.
#
#  This script is free software; you can redistribute it and/or modify it
#  under the same terms as Perl itself.

use warnings;
use strict;

use Getopt::Long;
Getopt::Long::Configure('bundling');

my ($verbose, $no_act, $force, $op);

die "Usage: rename [-v] [-n] [-f] perlexpr [filenames]\n"
    unless GetOptions(
  'v|verbose' => \$verbose,
  'n|no-act'  => \$no_act,
  'f|force'   => \$force,
    ) and $op = shift;

$verbose++ if $no_act;

if (!@ARGV) {
    print "reading filenames from STDIN\n" if $verbose;
    @ARGV = <STDIN>;
    chop(@ARGV);
}

for (@ARGV) {
    my $was = $_;
    eval $op;
    die $@ if $@;
    next if $was eq $_; # ignore quietly
    if (-e $_ and !$force)
    {
  warn  "$was not renamed: $_ already exists\n";
    }
    elsif ($no_act or rename $was, $_)
    {
  print "$was renamed as $_\n" if $verbose;
    }
    else
    {
  warn  "Can't rename $was $_: $!\n";
    }
}
