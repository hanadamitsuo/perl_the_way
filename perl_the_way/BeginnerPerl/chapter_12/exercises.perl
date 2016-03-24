#! /usr/bin/perl

use v5.10;

say '[1]';

#@errors;
#foreach (@ARGV) {
#  $file = $_;
#  push @errors,"NO file" unless -e $file;
#
#  push @errors,"wite ok\n" if -w $file;
#  push @errors,"read ok\n" if -r $file;
#  push @errors,"execute ok\n" if -x $file;
#}
#say @errors;


say '[2]';

#die "No file" if !@ARGS;
#$oldest_name = shift @ARGS;
#$oldest_age = -M $oldest_name;
#
#foreach (@ARGV) {
#  my $age = -M;
#  ($oldest_name, $oldest_age) = ($_, $age) if $age > $oldest_age;
#}
#
#printf "The oldest file was %s, and it was %d days old.\n", $oldest_name,$oldest_age

say '[3]';

foreach (@ARGV) {
  say "file $_" if -r -w -o $_;
}

