#!/usr/bin/env perl

# slightly modified version of vcf-to-tab that also outputs the ID column from the VCF (ie, the rs-number)

use strict;
use warnings;
use Carp;
use Vcf;

my $opts = parse_params();
convert_to_tab($opts);

exit;

#--------------------------------

sub error
{
    my (@msg) = @_;
    if ( scalar @msg )
    {
        croak @msg;
    }
    die
        "Usage: vcf-to-tab [OPTIONS] < in.vcf > out.tab\n",
        "Options:\n",
        "   -h, -?, --help                   This help message.\n",
        "   -i, --iupac                      Use one-letter IUPAC codes\n",
        "\n";
}


sub parse_params
{
    my $opts = { iupac=>0 };
    while (my $arg=shift(@ARGV))
    {
        if ( $arg eq '-?' || $arg eq '-h' || $arg eq '--help' ) { error(); }
        if ( $arg eq '-i' || $arg eq '--iupac' ) { $$opts{iupac}=1; next; }
        error("Unknown parameter \"$arg\". Run -h for help.\n");
    }

    if ( $$opts{iupac} )
    {
        $$opts{iupac} = 
        {
            'GG' => 'G',
            'CC' => 'C',
            'TT' => 'T',
            'AA' => 'A',

            'GT' => 'K',
            'TG' => 'K',
            'AC' => 'M',
            'CA' => 'M',
            'CG' => 'S',
            'GC' => 'S',
            'AG' => 'R',
            'GA' => 'R',
            'AT' => 'W',
            'TA' => 'W',
            'CT' => 'Y',
            'TC' => 'Y',

            '..' => '.',
        };
    }

    return $opts;
}


sub convert_to_tab
{
    my ($opts) = @_;

    my $iupac;
    if ( $$opts{iupac} ) { $iupac=$$opts{iupac}; }

    my $vcf = Vcf->new(fh=>\*STDIN);
    $vcf->parse_header();

    my $header_printed=0;

    while (my $x=$vcf->next_data_hash())
    {
        if ( !$header_printed ) 
        {
            print "#CHROM\tPOS\tID\tREF";
            for my $col (sort keys %{$$x{gtypes}})
            {
                print "\t$col";
            }
            print "\n";

            $header_printed = 1;
        }

        print "$$x{CHROM}\t$$x{POS}\t$$x{ID}\t$$x{REF}";
        for my $col (sort keys %{$$x{gtypes}})
        {
            my ($al1,$sep,$al2) = exists($$x{gtypes}{$col}{GT}) ? $vcf->parse_alleles($x,$col) : ('.','/','.');
            my $gt = $al1.'/'.$al2;
            if ( $iupac )
            {
                if ( !exists($$iupac{$gt}) ) { error(qq[Unknown IUPAC code for "$al1$sep$al2" .. $$x{CHROM}:$$x{POS} $col\n]); }
                $gt = $$iupac{$gt};
            }
            print "\t".$gt;
        }
        print "\n";
    }
}

