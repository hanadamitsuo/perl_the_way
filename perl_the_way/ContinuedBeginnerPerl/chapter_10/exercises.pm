package Oogaboogoo::exercises;

use strict;

my @day = qw(ark dip wap sen pop sep kir);
my @mon = qw(diz pod bod rod sip wax lin sen kum fiz nap dep);

sub day {
  my $num = shift @_;
  die "$num is not a valid day number"
    unless $num >= 0 and $num <= 6;
  $day[$num];
}

sub mon {
  my $num = shift @_;
  die "$num is not a valid month number"
    unless $num >= 0 and $num <= 11;
  $mon[$num];
}

1;
