#! /usr/bin/perl

use v5.10;
use 5.012;

say '[1]';

my @fred = qw { 1 3 5 7 9 };
my $fred_total = total(@fred);
print "fred total $fred_total\n";

#my $user_total = total(<STDIN>);
#print "use total $user_total\n";

sub total {
  my $sum;
  foreach (@_){
    $sum += $_;
  }
  return $sum;
}

say '[2]';

my $total = &total(1..1000);
say $total;

say '[3]';

my @above = &above_average(1..10);
say @above;

sub above_average {
  my $num = @_;
  my $sum;
  foreach (@_){
    $sum += $_;
  }
  
  my@list;
  my $average = $sum / $num;
  foreach (@_) {
    if ($average < $_) {
      push @list, $_;
    }
  }
  return @list;
}
 
say '[4]';

&greet('hanada');
&greet('yamada');

sub greet {
  state $back_name;
  my $name = shift;

  if ($back_name) {
    say "まえのひと$name";
  }
  else {
    say "あなた $name";
  }
  $back_name = $name;
}

say '[5]';

&greet2('hanada');
&greet2('yamada');
&greet2('okada');
&greet2('tanaka');

sub greet2 {
  state @back_name;
  my $name = shift;

  if (@back_name) {
    say "まえのひと$name";
  }
  else {
    say "あなた $name";
  }
  push @back_name , $name;
}
