#! /usr/bin/perl

use v5.10;
use 5.012;

my @array = qw#hoge hoge2 hoge3 hoge4#;
print "@array[0]\n";

sub call {
  my $n += 1;
  print "Hello world! $n\n";
}
&call;
&call;
&call;

sub sos {
  my $n = 5;
  my $h = 3;
  $n+$h;
}
my $sum =  5+&sos;
say $sum;

sub max {
  if ($_[0] > $_[1]) {
    $_[0];
  }
  else {
    $_[1];
  }
}
say &max(20,30);

sub job {
  if ($_[0] eq $_[1]) {
    $_[0]
  }
  else {
    $_[1]
  }
}
say &job('haha','haha');

my ($num,@num) = &lop(3,4,5,6,7,8,9);
sub lop {
  my ($hoge,@fuga) = shift @_;
  return $hoge,@fuga;
}
say $num;
say @num;

my $max = &lop2(3,4,5,6,7,8,9);
sub lop2 {
  my $hoge = shift @_;
  foreach (@_) {
    if ($_>$hoge) {
      $hoge = $_;
    }
  }
  $hoge;
}
say $max;

sub division {
  $_[0] / $_[1];
}
my $number2 = division 10, 2;
say $number2;

sub list {
  my ($a,$b) = @_;
  if ($a < $b) {
    $a..$b;
  }
  else {
    reverse $b..$a;
  }
}
say &list(11,6);

sub marine {
  state $n = 0;
  $n +=1;
  say $n;
}
&marine;
&marine;

ru_sum(5..8);

sub ru_sum {
  state $sum = 0;
  state @number;

  foreach (@_) {
    push @number, $_;
    $sum += $_;
  }
  say "ナンバー@number　合計$sum";
}
