#! /usr/bin/perl

use v5.10;

$name = kanon;

unless ($name =~ /l/) {
  say "OK";
}

if (!$name =~ /l/) {
  say "OK2";
}

$i = 1;
$j = 1;
until ($j > $i) {
  $j += 1;
}
say $j;

say "IF" if $j;

say "IF2" 
  if $j;

{
  say "ONE";
  say "TWO";
  say "3";
}

$_ = "c";
if ($_ eq "a") {
  say "JOB";
}
elsif ($_ eq "c") {
  say "KEN";
}
else {
  say "KON";
}

$num = 43;
$num++;
say $num;

$n = ++$n;
say "$n";

@list = (aa,bb,cc);
for (@list) {
  say "AA";
}

for ($i = 1; $i <= 10; $i++) {
  say "GON";
}

for ($i = 10; $i >= 1; $i--) {
  say "GLO";
}

#for (;;) {
#  say "AAAAA";
#}

#while (1) {
#  say "BBBBB";
#}
