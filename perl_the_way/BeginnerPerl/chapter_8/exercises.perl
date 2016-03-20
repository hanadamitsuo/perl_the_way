#! /usr/bin/perl

use v5.10;

say '[1]';

while (<>) {
  chomp;
  if (/match/) {
    say "MATCH |$'<$&>$'|";
  }
  else {
    say "NO MATCH |$_|";
  }
}

say '[2]';

while (<>) {
  chomp;
  if (/a\b/) {
    say "MATCH $_";
  }
  else {
    say "NO MATCH";
  }
}

say '[3]';

while (<STDIN>) {
  chomp;
  if (/(\b\w*a\b)/) {
    say "\'$1\'";
  }
}

say '[4]';

while (<STDIN>) {
  chomp;
  if (/(?<word>\b\w*a\b)/) {
    say "'$+{word}'";
  }
}

say '[5]';

while (<STDIN>) {
  chomp;
  if(m/(\b\w*a\b)(.{0,5})/xs) {
    say "$1 $2";
  }
}

say '[6]';

while (<>) {
  chomp;
  if (/\s\z/) {
    say "$_#";
  }
}

