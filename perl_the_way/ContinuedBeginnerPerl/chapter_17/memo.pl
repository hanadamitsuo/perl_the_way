#! /usr/bin/perl

use strict;
use v5.10;
#use Test::More tests => 20;
use Test::More "no_plan";

ok(1, '1 us ture');

is( 2 + 2, 4, 'The sum is 4');

is( 2 * 3, 5, 'The product is 5');

isnt ( 2 ** 3, 6, "The result isn't 6");

like( 'Alpaca Book', qr/alpaca/i, 'I found an alpaca!' );

is(sqrt(0), 0, 'the square root of is 0');

is(sqrt(1), 1, 'the square root of is 1');

is(sqrt(49), 7, 'the square root of is 7');

is(sqrt(100), 10, 'the square root of is 10');

is(sqrt(0.25), 0.5, 'the square root of is 0.25');

my $product = sqrt(7) * sqrt(7);

ok ( $product > 6.999 && $product < 7.001, "the product [$product] is around 7" );

sub test_sub { '10000' }

is( $@, '', '$@ is not set at start' );

{
  my $n = -1;
  eval { sqrt($n) };
  ok( $@, '$@ is set after sqrt(-1)' );
}

eval { sqrt(1) };
is( $@, '', '$@ is set after sqrt(2)' );

{
  my $n = -100;
  eval { sqrt($n) };
  ok( $@, '$@ is set after sqrt(-100)' );
}

is( sqrt ( test_sub()), 100, 'String value works in sqrt()' );

eval { sqrt(undef) };
is( $@, '', '$@ is not set after sqrt(undef)');

is( sqrt, 0, 'sqrt() works on $_ (undefined) by default' );

$_ = 100;
is( sqrt, 10, 'sqrt() works on $_ by default' );

is( sqrt( 10**100 ), 10**50, 'sqrt() can handle a googol' );

ok(1+2==3, '1+2==3');
ok(2*4==8, '2*4==8');
my $divide = 5/3;
ok(abs($divide -1.666667) < 0.001, '5/3 == (approx) 1.666667');
my $subtract = -3+3;
ok(($subtract eq '0' or $subtract eq '-0'), '-3+3 == 0');

#1..4
#ok 1 - 1 + 2 == 3
#ok 2 - 2 * 4 == 8
#ok 3 - 5 / 3 == (approx) 1.666667
#ok 4 - -3 + 3 == 0

is(1+2, 3, '1+2is3');
is(2*4, 6, '2*4is6');

my $divide2 = 5/3;
cmp_ok(abs($divide2 -1.666667), '<', 0.001, '5/3 should be (approx) 1.666667');

my $subtract2 = -3+3;
like($subtract2, qr/^-?0$/, '-3 + 3 == 0');

#use Horse;
BEGIN{ use_ok('Horse') }

my $trigger = Horse->named('Trigger');
isa_ok($trigger, 'Horse');
isa_ok($trigger, 'Animal');
can_ok($trigger, $_) for qw(eat color);

my $tv_horse = Horse->named('Mr. Ed');
isa_ok($tv_horse, 'Horse');

is($trigger->name, 'Trigger', 'Trigger name is correct');
is($tv_horse->name, 'Mr. Ed', 'Mr. Ed name is correct');
is(Horse->name, 'a generic Horse');

TODO: {
  local $TODO = "haveb't' taught Horses to talk yet";

  can_ok($tv_horse, 'talk');
}
is($tv_horse->name, 'Mr. Ed', 'I am Mr. Ed!');

SKIP: {
  skip 'Mac::Speech is not available', 1 unless eval { require 'Ma ::Speerch' };
  ok( $tv_horse->say_it_aloud('I am Mr. Ed'));
}

