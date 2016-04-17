#! /usr/bin/perl

use v5.10;
use IO::Tee;

say '[1]';

my $fh;
my $scaral;

print "Enter type of output[Scalar/File/Tee]> ";
my $type = <STDIN>;

if ($type =~ /^s/i) {
  open $fh, ">", \$scalar;
}
elsif ($type =~ /^f/i) {
  open $fh, ">", \$0.put;
}
elsif ($type =~ /^t/i) {
  open my $file_fh, ">", "$0.out";
  open my $scalar_fh, ">", \$scaral;
  $fh = IO::Tee->new($file_fh, $scalar_fh);
}

unless ($fh) {
  chomp $type;
  die "Unknow type $type";
}

my $data = localtime;
my $day_of_week = (localtime)[6];

print $fh <<"HERE";
This is run $$
The data is $data
the day of the week is $day_of_week
HERE

print STDOUT <<"HERE" if $type =~ m/^[st]/i;
Scalar contains;
$scalar
HERE
