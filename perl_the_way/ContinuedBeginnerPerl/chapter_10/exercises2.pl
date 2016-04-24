#! /usr/bin/perl

use v5.10;
use strict;

require 'exercises.pm';

my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;

my $day_name = Oogaboogoo::exercises::day($wday);
my $mon_name = Oogaboogoo::exercises::mon($mon);

$year += 1900;

print "Today is $day_name, $mon_name, $mday, $year.\n";
