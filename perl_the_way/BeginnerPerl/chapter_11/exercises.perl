#! /usr/bin/perl

use v5.10;
use Module::CoreList;
use DateTime;

say '[1]';

my %modules = %{ $Module::CoreList::version{5.014} };
say %modules;

say '[2]';

$now = DateTime->now(time_zone => 'local');
$user_time = DateTime->new(
  year  => $ARGV[0],
  month => $ARGV[1],
  day   => $ARGV[2],
);

$num = $now - $user_time;
@units = $num->in_units(qw/years months days/);
printf "%d years, %d months, and %d days\n", @units;
