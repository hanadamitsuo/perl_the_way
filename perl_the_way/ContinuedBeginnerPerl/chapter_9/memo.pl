#! /usr/bin/perl

use v5.10;
use strict;

my @sorted = qw(Gilligan Skipper Professor Ginger Mary_Ann);
say @sorted;

my @wrongly_sorted = sort 1, 2, 4, 6, 16, 32;
say @wrongly_sorted;

my @numerically_sorted = sort {
  if ($a > $b) {-1}
  elsif ($a > $b) {+1}
  else {0}
} 1, 2, 4, 8, 16, 32;
say @numerically_sorted;

my @num = reverse sort { $a <=> $b } 1, 2, 4, 8, 16, 32;
say @num;

my @input = qw(Gilligan Skipper Professor Ginger Mary_Ann);
my @sort_position = sort {$input[$a] cmp $input[$b]} 0..$#input;
print "@sort_position\n";

my @input2 = qw(Gilligan Skipper Professor Ginger Mary_Ann);
my @sorted_position2 = sort {$input2[$a] cmp $input2[$b]} 0..$#input2;
my @ranks;
@ranks[@sorted_position2] = (0..$#sorted_position2);
print "@ranks\n";

for (0..$#ranks) {
  say "$input[$_] sorts into position $ranks[$_]";
}

my @castaways = 
  qw(Gilligan Skipper Professor Ginger Mary_Ann);
#my @wasters = sort {
#  ask_monkey_about($b) <=> ask_monkey_about($a)
#} @castaways;
#say @wasters;

my @input_data = (1,2,3,4,5,6,7,8,9);
my @output_data =
  map $_->[0],
  sort {$a->[1] cmp $b->[1] }
  map [$_, "\U$_"],
  @input_data;
say @output_data;

sub factorial {
  my $n = shift;
  if ($n <= 1) {
    return 1;
  } else {
    return $n * factorial($n-1);
  }
}

