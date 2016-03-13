#! /usr/bin/perl

use v5.10;

$_ = "a3ayay daaba boo";
if (/aba/) {
  say "HELLO";
}

if (/\p{Space}/) {
  say "Bye";
}

if (/\p{Digit}/) {
  say "OK";
}

if (/\p{AHex}\p{AHex}/) {
  say "ROW";
}

$_ = 'a real \\ backslash';
if (/\\/) {
  say "POP";
}

$_ = "abba";
if (/(.)\1/) {
  say "KOK";
}

$_ = "aa11bb";
if (/(.)\111/) {
  print "MOM";
}

if (/(.)\g{-1}11/) {
  print "JOJ";
}

