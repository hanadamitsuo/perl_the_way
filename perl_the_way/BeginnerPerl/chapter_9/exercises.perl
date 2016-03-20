#! /usr/bin/perl

use v5.10;

say '[1]';

$str = <STDIN>;
$what = 'fred|barney';
if ($str =~ /($what){3}/) {
  say "OK";
}

say '[2]';

  
