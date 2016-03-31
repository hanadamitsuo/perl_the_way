#! /usr/bin/perl

use v5.10;

say '[1]';

#$file = 'test.txt';
#open $fh, '<', $file or die "Can't open '$file' : $!";
#chomp(@str = <$fh>);
#for(;;){
#  chomp($patten = <STDIN>);
#  last if $patten =~ /\A\s*\Z/;
#  @match = eval {
#    grep /$patten/, @str;
#  };
#  if($@) {
#    say "error : $@";
#  }
#  else {
#    $count = @match;
#    print "$count\n",map "$_\n", @match;
#  }
#}
#close($fh);

say '[2]';

foreach (glob('*')) {
  ($atime, $mtime) = (stat)[8,9];
  say "$_ $atime $mtime";
}

say '[3]';

#foreach $file (glob('*')) {
#  ($atime, $mtime) = map {
#    ($year,$month,$day) = (localtime($_))[5,4,3];
#    $year += 1900;
#    $month += 1;
#    $result = "$year-$month-$day";
#  } (stat $file)[8,9];
#  say "$file $atime $mtime";
#}
