#! /usr/bin/perl

use v5.10;

say '[1]';

#@list = <>;
#foreach (@list) {
#  say "OK" if $_ =~ /fred/;
#}

say '[2]';

#@list = <>;
#foreach (@list) {
#  say "OK" if $_ =~ /fred/i;
#}

say '[3]';

#@list = <>;
#foreach (@list) {
#  say "OK" if $_ =~ /\./;
#}

say '[4]';

#@list = <>;
#foreach (@list) {
#  say "OK" if $_ =~ /[A-Z][a-z]+/;
#}

say '[5]';

#@list = <>;
#foreach (@list) {
#  say "OK" if $_ =~ /(/S)\1/;
#}

say '[6]';

@list = <>;
foreach (@list) {
  if ($_ =~ /fred/) {
    if ($_ =~ /wilma/) {
      say "OK";
    }
  }
}
