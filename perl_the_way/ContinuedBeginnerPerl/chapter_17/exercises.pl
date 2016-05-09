#! /usr/bin/perl

use strict;
use v5.10;

say '[1]';

use Test::More 'no_plan';

BEGIN{ use_ok('My::List::Util') }

ok( defined &sum, "The sum() routine exists");
is( sum(2,2),4, '2+2=4');
is( sum(2,2,3),7, '2+2+3=7');
is( sum(),0, 'null sum is 0');
is( sum(-1),-1, '-1 = -1');
is( sum(-1,1), 0, '-1+1=0');
is( sum( 'Ginger', 5), 5, 'A string + 5 = 5');
is( sum (qw(Ginger Mary-Ann)),0,'Two string give 0');

ok( defined &shuffle, "The shuffle() routine exists");
my $array = [qw(a b c d e f)];

my $shuffled = $array;
shuffle( $shuffled );

my $same_count = 0;

foreach my $index (0..$#$array) {
  $same_count++ if $shuffled->[$index] eq $array->[$index];
}

cmp_ok($same_count, '<', $#$array -2, 'At least two positions are different');
