#! /usr/bin/perl

use v5.10;

my @array = qw#hoge hoge2 hoge3 hoge4#;
print "@array[0]\n";

sub call {
  $n += 1;
  print "Hello world! $n\n";
}
&call;
&call;
&call;

sub sos {
  $n = 5;
  $h = 3;
  $n+$h;
}
$sum =  5+&sos;
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

say &job(haha,haha);
