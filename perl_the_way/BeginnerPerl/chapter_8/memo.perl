#! /usr/bin/perl

use v5.10;

chomp($_=<STDIN>);
if (/yes/i) {
  say "YES";
}

$_ = "I say baty\nwhith fread\n";
if (/baty.*fread/s) {
  say "BATY FREAD";
}

$_ = "1ass";
if (/ [0-9] a s s/x) {
  say "NUM";
}

$_ = "ken5akanagt";
if (/ ken . *kana /xs) {
  say "KEN KANA";
}

$_ = "kaen5akanagt";
if (/\Akaen/) {
  say "A KEN";
}

if (/agt\z/) {
  say "AGT";
}

$_ = "lopfreadbaty";
if (/baty$/) {
  say "BATY";
}

if (/\bfread\b/) {
  say "NO MATCH";
}

$other = "I dream of brtty rubble";
if ($other =~ /\brub/) {
  say "OTHER";
}

$what = "larry";

while (<>) {
  if (/\A($what)/) {
    say "WE SAY $what of $_";
  }
}

$_ = "HELLO OTHER, NIGHT";
if (/(\S+) (\S+), (\S+)/) {
  say "HELLO OTHER";
}

if (/(?:bronto)?saurus (steak|burger)/) {
  say "BRONTO";
}

$name = 'Fred or Barney';
if ($name =~ /(\w+) and (\w+)/) {
  say "NO MATCH!";
}

if ($name =~ /(\w+) (or|and) (\w+)/) {
  say "MATCH!";
}

$name = 'Fred Flintstone and Wlima Flintstone';
if ($name =~ m/(?<last_name>\w+) and \w+ \k<last_name>/) {
  say "I SAY $+{last_name}";
}
