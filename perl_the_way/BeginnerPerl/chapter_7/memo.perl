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

$_ = "aaff";
if (/aa|ss|dd/) {
  say "KEN";
}

$_ = "123";
if (/[123]/) {
  say "LOP";
}

if (/[1-3]/) {
  say "YOU";
}

$_ = "abcd";
if (/[^abc]/) {
  say "ray";
}

$_ = "a-c";
if (/[a\-c]/) {
  say "GOB";
}

$_ = "a13213sfnoewfoiwhf";
if (/a[\d]+/) {
 say "ALL";
}

$_ = "a2313";
if (/a[\d]+/a) {
 say "TOU";
}

$_ = " ";
if (/\s/a) {
 say "NULL";
}

if (/[\v\h]/) {
 say "ALL NULL";
}

$_ = " f,^1@`";
if (/[\d\D]/) {
 say "QQ";
}

if (/[^\d\D]/) {
 say "HANADA";
}
