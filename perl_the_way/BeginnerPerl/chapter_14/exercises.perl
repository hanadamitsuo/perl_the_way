#! /usr/bin/perl

use v5.10;

say '[1]';

#$str = <>;
#@num = split /\s+/, $str;
#@sort_num = (sort {$a <=> $b} @num);
#foreach (@sort_num) {
#  printf "%20g\n",$_;
#}

say '[2]';

#%last_name = qw{
#  fred flintstone Wilma Flintstone Barney Rubble
#  betty rubble Bamm-Bann Rubble PEBBLES FLINTSTONE
#};
#
#@keys = sort {"\L$last_name{$a}" cmp "\L$last_name{$b}" or "\L$a" cmp "\L$b"} keys %last_name;
#foreach (@keys) {
#  say "$last_name{$_}, $_";
#}

say '[3]';

say "もじ";
chomp($str = <STDIN>);
say "ぶぶん";
chomp($str_line = <STDIN>);

@placse;
for ($pos = -1; ;) {
  $pos = index($str, $str_line, $pos + 1);
  last if $pos == -1;
  push @placse, $pos;
}
say "もじ:$str ぶぶん:$str_line ばしょ:@placse";
