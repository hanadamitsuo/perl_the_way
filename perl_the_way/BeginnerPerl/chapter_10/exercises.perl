#! /usr/bin/perl

use v5.10;

say '[1]';

#$rand = int(1+rand 100);
#for (;;) {
#  chomp($num = <STDIN>);
#  
#  last if $num =~ /quit|exit|\s/i;
#  say "BIG" if $num > $rand;
#  say "SMALL" if $num < $rand;
#
#  if ($num == $rand) {
#    say "OK";
#    last;
#  }
#}

say '[2]';

#$rand = int(1+rand 100);
#$deb = $ENV{DEBUG} // 1;
#for (;;) {
#  chomp($num = <STDIN>);
#
#  say "$rand" if $deb;
# 
#  last if $num =~ /quit|exit|\s/i;
#  say "BIG" if $num > $rand;
#  say "SMALL" if $num < $rand;
#
#  if ($num == $rand) {
#    say "OK";
#    last;
#  }
#}

say '[3]';

$ENV{FRED} = 'fred';
$ENV{UNDEF} = '';

foreach ( keys %ENV ) {
  $env = $ENV{$_} ? $ENV{$_} : "undef";
  say $env;
}
