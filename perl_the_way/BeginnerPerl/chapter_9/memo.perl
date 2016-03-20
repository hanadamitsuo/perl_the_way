#! /usr/bin/perl

use v5.10;

$_ = "hello out sied BATY";
s/BATY/UTOU/;
say "$_";

s/with (\w+)/against $1's them/;

$_ = "home sweet home!";
s/home/cave/g;
say "$_\n";

$file_name = "/ss/ss/dd.pp.txt";
if ($file_name =~ s#^.*/##s) {
  say "$flile_name";
}

$org = 'Fred ate 1 rib';
$copy = $org;
$copy =~ s/d+ ribs?/10 ribs/;
say $copy;

$_ = "i say barney with fred";
s/(fred|barney)/\U$1/gi;
say $_;

s/(fred|barney)/\u$1/gi;
say $_;

@list = split /:/, "abc:def:g:h";
say @list;

$_ = "aa bb cc";
@list = split;
say @list;

$x = join ":", 4,5,7,8;
say $x;

$y = join "foo", "bar";
$hoge = join "baz", @y;
say $hoge;

$_ = "Hello there, neighboor";
($hoge ,$fuga, $honge) = /(\S+) (\S+), (\S+)/;
say "$fuga is $honge";

$_ = "I'm much better\nthab Barney is\nat bow,job";
say $_;

chomp($data = 'data');
$^I = ".bak";

while (<>) {
  s/^Author:.*/Author: Randal L. Schwartz/;
  s/^Phone:.*\n//;
  print;
}

$data = localtime;
say $data;

while (<>) {
  printl
}


