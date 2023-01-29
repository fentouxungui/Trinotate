#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;


## we delete all files we don't need in this directory. Be careful in case users try running it somewhere else, outside this dir.
chdir $FindBin::RealBin or die "error, cannot cd to $FindBin::RealBin";



my @files_to_keep = qw (
cleanme.pl 
runMe.sh
runMe.docker.sh
                        );


my %keep = map { + $_ => 1 } @files_to_keep;


foreach my $file (<*>, <input_data/*>) {
	
	if ( (! $keep{$file}) && $file !~ /\.t?gz$/) {
		print STDERR "-removing file: $file\n";
		unlink($file);
	}
}


`rm -rf edgeR_trans/ `;
`rm -rf edgeR_genes`;


exit(0);