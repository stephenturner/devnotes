#!/usr/bin/perl

# ls-follow
# refreshes the contents of the current working directory every second

chomp(my $pwd = `pwd`);
my $help = "\n\tUsage: $0 <> \n\n";
#die $help if @ARGV!=0;

if ($ARGV[0] =~ /\d/) {
	$delay=$ARGV[0];
}	else {
	$delay=1;
}

while (1) {
	$contents=`ls -lhgGop`;
	print localtime(time) . "\n" . $pwd . "\n" . $contents . "\n";
	sleep($delay);
}




