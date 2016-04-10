#! /usr/bin/perl

use v5.10;
use Data::Dumper;
#use YAML;
use Storable;

%total_bytes;
while (<>) {
  ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}
print Dumper (\%total_bytes);

say "$total_bytes{$source}{$destination}";

foreach $source (keys %total_bytes) {
  for $destination (sort keys %{$total_bytes{$source}}) {
    print "$source => $destination:","$total_bytes{$source}{$destination} byte\n"
  }
  print "\n";
}

$Data::Dumper::Purity=1;
my @data1 = qw/ one, won /;
my @data2 = qw/ two, too, to /;
push @data2, \@data1;
push @data1, \@data2;

print Dumper (\@data1, \@data2);

#print Dump(\%total_bytes);

store [\@data1, \@data2], 'test.txt';

$result = retrieve 'test.txt';
print Dumper($result);

($arr1, $arr2) = @{ retrieve 'test.txt' };
print Dumper($arr1, $arr2);

@x = (1,2,3,4,5);
@y = (6,7,8,9);

@bigger = grep {
  if ($_ > $#y or $x[$_] > $y[$_]) {
    1;
  } else {
    0;
  }
} 0..$#x;
@big = @x[@bigger];
say "@big";

@bigger2 = grep {
  $_ > $#y or $x[$_] > $y[$_];
} 0..$#x;
@big2 = @x[@bigger2];
say "@big2";

@bigger3 = map {
  if ($_ > $#y or $x[$_] > $y[$_]) {
    $x[$_];
  } else {
    ();
  }
} 0..$#x;
say "@bigger3";

%provisions = (
  'The Skipper'   => [qw(bule_shirt hat jacket preserver sunscreen)],
  'The Professor' => [qw(unscreen water_bottle side_rule batteries radio)],
  'The Gilligan'  => [qw(red_shirt hat lucky_socks water_bottle)],
);

my @packed = grep @{ $provisions{$_} } < 5, keys %provisions;
say "@packed";

@all = grep {
  @item = @{ $provisions{$_} };
  grep $_ eq 'water_bottle', @item;
} keys %provisions;
say "@all";

@person = map {
  $person = $_;
  @items = @{ $provisions{$person} };
  map [$person => $_], @items;
} keys %provisions;
say "@person";
