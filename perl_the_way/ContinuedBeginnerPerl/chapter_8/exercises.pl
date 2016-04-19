#! /usr/bin/perl

use v5.10;
use IO::Tee;
use strict;

say '[1]';

#my $fh;
#my $scaral;
#
#print "Enter type of output[Scalar/File/Tee]> ";
#my $type = <STDIN>;
#
#if ($type =~ /^s/i) {
#  open $fh, ">", \$scalar;
#}
#elsif ($type =~ /^f/i) {
#  open $fh, ">", \$0.put;
#}
#elsif ($type =~ /^t/i) {
#  open my $file_fh, ">", "$0.out";
#  open my $scalar_fh, ">", \$scaral;
#  $fh = IO::Tee->new($file_fh, $scalar_fh);
#}
#
#unless ($fh) {
#  chomp $type;
#  die "Unknow type $type";
#}
#
#my $data = localtime;
#my $day_of_week = (localtime)[6];
#
#print $fh <<"HERE";
#This is run $$
#The data is $data
#the day of the week is $day_of_week
#HERE
#
#print STDOUT <<"HERE" if $type =~ m/^[st]/i;
#Scalar contains;
#$scalar
#HERE

say '[2]';

#my %output_handles;
#while (<>) {
#  unless (/^(\S+):/){
#    warn "ignoring the line with missing name: $_";
#    next;
#  }
#  my $name = lc $1;
#  my $handle = $output_handles{$name} ||=
#    IO::File->new(">$name.info") || die "Cannot create $name.info:$!";
#    print $handle $_;
#}

say '[3]';

use IO::Dir;

my @not_dirs = grep { ! -d} @ARGV;
foreach my $not_dir (@not_dirs){
  print "$not_dir is not a directory!\n";
}

my @dir_hs = map { IO::Dir->new($_) } grep { -d } @ARGV;

foreach my $dh (@dir_hs) { print_contents($dh) };

sub print_contents {
  my $dh = shift;

  while(my $file = $dh->read) {
    next if( $file eq '.' or $file eq '..');
    print "$file\n";
  }
}
