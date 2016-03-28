#! /usr/bin/perl 

use v5.10;

#while (<STDIN>) {
#  chomp;
#  @items = split /:/;
#  ($card, $count) = ($items[1], $items[5]);
#}
#say "$card, $count";

#while (<STDIN>) {
#  chomp;
#  ($name, $card, $home) = split /:/;
#}
#say "$name, $card, $home";

#while (<STDIN>) {
#  chomp;
#  ($name, undef, $card, $home) = split /:/;
#}
#say "$name, $card, $home";

#while (<STDIN>) {
#  chomp;
#  ($name, undef, $card, $home) = (split /:/)[1];
#}
#say "$name, $card, $home";

#while (<STDIN>) {
#  chomp;
#  ($name, undef, $card, $home) = (split /:/)[1,5];
#}
#say "$name, $card, $home";

@names = qw/ zero one two three four five six seven eight nine/;
@numbers = (@names)[9,0,2,1,0];
say "Bedrock @numbers";

$score{"barney"} = 1;
@three_scores = ($score{"barney"}, $score{"fred"}, $score{"dino"});
say "@three_scores";

@players = qw/ barney fred dino/;
@score = (195, 205, 30);
@score{@players} = @score;
say @score;

$fred = 0;
$dino = 0;

#$barney = $fred / $dino;

eval {$barney = $fred / $dino};
say "$barney";

$barney = eval {$fred / $dino};
say "$barney";

$barney = eval {$fred / $dino} // 'NaN';
say "$barney";

$barney = eval {$fred / $dino} // 'NaN';
say "$barney $@" if $@;

unless (eval { $fred / $dino}) {
  say "$dino $@" if $@;
}

foreach $person (qw/test2.txt test3.txt/) {
  eval {
    open $fh, '<', $person or die "catnot open: $!";

    ($total, $count);

    while (<$fh>) {
      $total += $_;
      $count++;
    }

    $average = $total/$count;
    say "Average for file $person was $average";

    &do_something($person, $average);
  };

  if($@) {
    say "$@ OK";
  }
}

foreach $person (qw/test2.txt test3.txt/) {
  eval {
    open $fh, '<', $person or die "catnot open: $!";

    ($total, $count);

    while (<$fh>) {
      $total += $_;
      $count++;
    }

    $average = eval {$total/$count} // 'NaN';
    say "Average for file $person was $average";

    &do_something($person, $average);
  };

  if($@) {
    say "$@ OK";
  }
}

#eval {
#  say "there is a mismatched quote";
#  $sum =  42 +;
#  /[abc/
#  say "Final";
#}

use Try::Tiny;

$barney =
  try { $fred / $dino} 
  catch {
    say "Error was $_";
  };

$barney =
  try { $fred / $dino} 
  catch {
    say "Error was $_";
  };
  finally {
    say @_ ? 'error' : 'wored'
  };

use autodie;

$filename = 0;
open $fh, '>', $filename;

open $fh, '>', $filename;

given ($@) {
  when (undef) {say "NO error";}
  when ('open') {say "error open";}
  when (':io') {say "IO error";}
  when (':all') {say "autodie error";}
  default {say "NO autodie error";}
}

@odd_number;
foreach (1..1000) {
  push @odd_number, $_ if $_ %2 ;
}

@odd_numbers = grep {$_ % 2} 1..1000;
say @odd_numbers;

$str = grep /\bfred\b/i, 'dsadfredsasa';
say "$str OK";

