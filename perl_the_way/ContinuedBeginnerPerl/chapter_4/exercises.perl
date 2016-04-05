#! /usr/bin/perl

use v5.10;

say '[2]';

@ski = qw/bule_shirt hat jacket preserver sunscreen/;
@gill = qw/red_shirt hat lucky_socks water_bottle/;
@prof = qw/unscreen water_bottle side_rule batteries radio/;
%all = (
  "Gillgan" => \@gill,
  "Skipper" => \@ski,
  "Professor" => \@pro,
);

check_items_for_all(\%all);

sub check_items_for_all {
  $all = shift;

  foreach (keys %$all) {
    check_required_items($_, $all->{$_});
  }
} 

sub check_required_items {
  $who = shift;
  $items = shift;

  @req = qw/preserver sunscreen water_bottle jacket/;
  @missing = ();

  for $item (@req) {
    unless (grep $item eq $_, @$items) {
      say "$who is missing $item";
      push @missing, $item;
    }
  }
  
  if(@missing) {
    say "@missing to @$items for $who";
    push @$itmes, @missing;
  }
}
