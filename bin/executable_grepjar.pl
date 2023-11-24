#! /usr/bin/perl

my $snippet = shift;

open ALLJARS,"alljars.txt" or die "no alljars.txt in this directory";
while( <ALLJARS> ) {
    $line = $_;
    if( $line =~ m/__NEWFILE: (.*)/ ) {
	$habschon = undef;
	$currentfile = $1;
	next;
    }
    if( $line =~ m/$snippet/i ) {
	print "$currentfile\n" unless defined $habschon;
	$habschon = 1;
    }
}
close ALLJARS;
# vim: ts=8 sw=4
