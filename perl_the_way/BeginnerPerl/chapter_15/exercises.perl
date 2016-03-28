#! /usr/bin/perl

use v5.10;

say '[1]';

#$rand = int(1+rand 100);
#for (;;) {
#  chomp($num = <STDIN>);
#  
#  $flg = 0;
#  given ($num) {
#    when(! /\A\d+\Z/) {say "NO num"; $flg++;}
#    when(! /quit|exit|\s/) {say "NOT"; $flg++;}
#    when($_ > $rand) {say "BIG";}
#    when($_ < $rand) {say "SMALL";}
#    when($_ == $rand) {say "OK"; $flg++;}
#  }
#  last if $flg>0;
#}

say '[2]';

#$num = <STDIN>;
#foreach (1 .. $num) {
#  $str = '';
#  given ($_) {
#    when (not $_ % 3) {$str .= "Fizz"; continue}
#    when (not $_ % 5) {$str .= "Buzz"; continue}
#    when (not $_ % 7) {$str .= "Sausage";}
#  }
#  say "$_ is $str";
#}

say '[3]';

for (@ARGV) {
  given ($_) {
    when(! -e) {say "NOT file"}
    when(-r) {say "read file"}
    when(-w) {say "write file"}
    when(-x) {say "execute file"}
  }
}

say '[4]';

given ($ARGV[0]) {
    when(! /\A\d+\Z/) {say "NOT num"}

    @divisors = divisors($_);
    @empty;
    when(@divisors ~~ @empty) {say "num is prime"}
    default{say "$_ is @divisors"}
}

sub divisors {
  $num = shift;

  @divisors = ();
  foreach (2 .. $num/2) {
    push @divisors, $_ unless $num % $_;
  }
  return @divisors;
}

say '[5]';

$favorite = 42;

given ($ARGV[0]) {
    when(! /\A\d+\Z/) {say "NOT num"}

    @divisors = divisors($ARGV[0]);
    when(2 ~~ @divisors) {say "$_ is even"; continue}
    when(!(2 ~~ @divisors)) {say "$_ is odd"; continue}
    when($favorite ~~ @divisors) {say "$_ is divisors favorite num"; continue}
    when($favorite) {say "$_ is favorite num"; continue}

    @empty;
    when(@divisors ~~ @empty) {say "num is prime"}
    default{say "$_ is @divisors"}
}

sub divisors {
  $num = shift;

  @divisors = ();
  foreach (2 .. ($ARGV[0]/2 + 1)) {
    push @divisors, $_ unless $num % $_;
  }
  return @divisors;
}
