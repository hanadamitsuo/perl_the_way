#! /usr/bin/perl

use v5.10;

$word = "Howdy world!";
$where = index($word, "w");
say $where;

$where = index($word, "w", $where + 1);
say $where;

$name = substr("Fred J. Flintstone", 13);
say $name;

$name = substr("Fred J. Flintstone", -3, 2);
say $name;

$long = "some very very long string";
$right = substr($long, index($long, "l"));
say $right;

$money = sprintf "%.2f", 2.489997;
say $money;

say hex('DEADBEEF');

say oct('0377');

@some_number = (33,22,11);
sub by_number {
  if ($a < $b) {1} elsif ($a > $b) {1} else {0}
}
@result = sort by_number @some_number;
say @result;

@any_string = (cc,bb,aa);
sub by_code_point { $a cmp $b }
@string = sort by_code_point @any_string;
say @string;

@numbers = sort { $a <=> $b } @some_number;
say @numbers;


%score = ("barney" => 195, "fred" => 205, "dino" => 30);
sub by_score { $score{$b} <=> $score{$a} }
@winners = sort by_score keys %score;
say @winners;

sub by_score_and_name {
  $score{$b} <=> $score{$a} or $a cmp $b 
}
@winners = sort by_score_and_name keys %score;
say @winners;


