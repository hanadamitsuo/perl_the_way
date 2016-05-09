#! /usr/bin/perl

use strict;
use v5.10;
#use Oogaboogoo::data qw(day mon);
use Oogaboogoo::data2 qw(:all);

say '[1]and[2]';

my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;
my $day_name = day($wday);
my $mon_name = mon($mon);
$year += 1900;
say "today is $day_name, $mon_name $mday, $year";

