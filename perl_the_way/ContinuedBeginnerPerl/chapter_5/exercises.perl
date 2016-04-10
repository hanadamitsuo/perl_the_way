#! /usr/bin/perl

use v5.10;

say '[2]';

$all = "**all machine**";

%total_byte;
while(<>){
  next if /^#/;
  ($source, $destination, $bytes) = split;
  $total_byte{$source}{$destination} += $bytes;
  $total_byte{$source}{$all} += $bytes;
}
@source = sort {$total_byte{$b}{$all} <=> $total_byte{$a}{$all}} keys %total_bytes;

for $source (@source) {
  print "$source: $tb->{$all} total bytes sent\n";
  $tb = $total_bytes{$source};
  my @dastinations = sort{$tb->{$b} <=> $tb->{$a} } keys %$tb;
  for $destination (@dastinations) {
    next if $destination eq $all;
    print "  $source => $destination: $tb->{$destination} byte\n";
  }
  print "\n";
}
