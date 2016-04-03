#! /usr/bin/perl

use v5.10;

say '[1]';

@list = grep {-s $_ < 1000} @ARGV;
say map {"    $_"} @list;

say '[2]';

chdir '/Users/admin/perl/perl_the_way/ContinuedBeginnerPerl/chapter_2';

for (;;) {
  chomp($result = <STDIN>);
  last unless (defined $result && length $result);

  print map {"    $_\n"} grep {eval {/$result/}} glob(".* *");
}
