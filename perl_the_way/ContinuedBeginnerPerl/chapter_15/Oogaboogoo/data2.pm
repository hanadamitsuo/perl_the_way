package Oogaboogoo::data2;

use strict;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(day mon);
our %EXPORT_TAGS = (all => \@EXPORT);

my @day = qw(ark dip wap sen pop sep kir);
my @mon = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub day {
  my $num = shift @_;
  die "$num is not valid day number"
    unless $num >= 0 and $num <= 6;
  $day[$num];
}

sub mon {
  my $num = shift @_;
  die "$num is not valid month number"
    unless $num >= 0 and $num <= 11;
  $day[$num];
}

1;
