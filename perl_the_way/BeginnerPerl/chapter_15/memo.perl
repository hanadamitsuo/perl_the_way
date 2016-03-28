#! /usr/bin/perl

use 5.010001;

$name = "FRED";
say "I found Fred" if $name ~~ /FRED/;

%names = ('FRED'=>1,'FRRD'=>2);
$flag = 0;
foreach (keys %names) {
  next unless $_ =~ /FRED/;
  $flag = $_;
  last;
}
say "$flag" if $flag;

say "I found FRED" if %names ~~ /FRED/;

say "I found Fred" if /FRED/ ~~ %names;

@name1 = (11,22,33,44);
@name2 = (aa,ss,dd,ff);
$equal = 0;
foreach (0 .. $#name1) {
  last unless $names1[$index] eq $name2[$index];
  $equal++;
}
say "the arrays elemant " if $equal == @names1;

say "the arrays elemant 2" if @names1 ~~ @names2;

sub max {
  if ($_[0] > $_[1]) {
    $_[0];
  }
  else {
    $_[1];
  }
}
@nums = (1,2,3,7,42);
$result = max(@nums);
say "the result [$result] value (@nums)" if $result ~~ @nums;

say "mach number ~~ string" if 4 ~~ '4abc';
say "mach string ~~ number" if '4abc' ~~ 4;

given ($ARGV[0]) {
  when ('Fred') { say 'fred'}
  when (/\AFred/) { say '\Afred'}
  when (/Fred/i) { say 'fred i'}
  default { say 'see Fred'}
}

given ($ARGV[0]) {
  when ($_ ~~ 'Fred') { say 'fred'}
  when ($_ ~~ /\AFred/) { say '\Afred'}
  when ($_ ~~ /Fred/i) { say 'fred i'}
  default { say 'see Fred'}
}

given ($ARGV[0]) {
  when ($_ ~~ 'Fred') { say 'fred'; break}
  when ($_ ~~ /\AFred/) { say '\Afred'; break}
  when ($_ ~~ /Fred/i) { say 'fred i'; break}
  default { say 'see Fred'; break}
}

given ($ARGV[0]) {
  when ($_ ~~ 'Fred') { say 'fred'; continue}
  when ($_ ~~ /\AFred/) { say '\Afred'; continue}
  when ($_ ~~ /Fred/i) { say 'fred i'; continue}
  default { say 'see Fred'; continue}
}

given ($ARGV[0]) {
  when ($_ ~~ 'Fred') { say 'fred'; continue}
  when ($_ ~~ /\AFred/) { say '\Afred'; continue}
  when ($_ ~~ /Fred/i) { say 'fred i';}
  when (1==1) { say 'see Fred';}
}

given ($ARGV[0]) {
  when ($_ eq 'Fred') { say 'fred'; continue}
  when ($_ =~ /\AFred/) { say '\Afred'; continue}
  when ($_ =~ /Fred/i) { say 'fred i';}
  default { say 'see Fred';}
}

given ($ARGV[0]) {
  when ('Fred') { say 'fred'; continue}
  when ($_ =~ /\AFred/) { say '\Afred'; continue}
  when (/Fred/i) { say 'fred i';}
  default { say 'see Fred';}
}

$boolean = 1;
given ($ARGV[0]) {
  when (! $boolean) { say 'name has fred';}
  when (! /Fred/i) { say 'Does not fred';}
}

@names = qw/fred ken kana taro/;
foreach (@names) {
  when ('Fred') { say 'fred'; continue}
  when (/\AFred/) { say '\Afred'; continue}
  when (/Fred/i) { say 'fred i';}
  default { say 'see Fred';}
}

@names = qw/fred ken kana taro/;
foreach (@names) {
  say "naem $_";

  when ('Fred') { say 'fred'; continue}
  when (/\AFred/) { say '\Afred'; continue}
  when (/Fred/i) { say 'fred i';}
  default { say 'see Fred';}
}
