#! /usr/bin/perl

use v5.10;

$name = kanon;

unless ($name =~ /l/) {
  say "OK";
}

if (!$name =~ /l/) {
  say "OK2";
}

$i = 1;
$j = 1;
until ($j > $i) {
  $j += 1;
}
say $j;

say "IF" if $j;

say "IF2" 
  if $j;

{
  say "ONE";
  say "TWO";
  say "3";
}

$_ = "c";
if ($_ eq "a") {
  say "JOB";
}
elsif ($_ eq "c") {
  say "KEN";
}
else {
  say "KON";
}

$num = 43;
$num++;
say $num;

$n = ++$n;
say "$n";

@list = (aa,bb,cc);
for (@list) {
  say "AA";
}

for ($i = 1; $i <= 10; $i++) {
  say "GON";
}

for ($i = 10; $i >= 1; $i--) {
  say "GLO";
}

#for (;;) {
#  say "AAAAA";
#}

#while (1) {
#  say "BBBBB";
#}

for (1..10) {
  say "$_";
}

while (<STDIN>) {
  if (/__END__/) {
    last;
  }
  elsif (/fred/) {
    print;
  }
}

$num = 0;
@row = qw/11 22 : 33/;
foreach (@row) {
  next if /\W/;
  $num += 1;
}
say "$num";

$error = 0;
@list = qw/aa bb cc dd/;
foreach (@list) {
  say "$_";
  chomp(my $try = <STDIN>);
  if ($try ne $_) {
    $error++;
    redo;
  }
}

$ken = 1;
$bl = $ken ? 'OK' : 'NG';
say "$bl";

$hour = 10;
if ( (9 <= $hour) && ($hour < 17)) {
  say "WORK";
}

$undef;
$go = 1;
$to = $undef || $go;
say "$to";

$ver = $ENV{VERBOSE} // 1;
say "$ver";
