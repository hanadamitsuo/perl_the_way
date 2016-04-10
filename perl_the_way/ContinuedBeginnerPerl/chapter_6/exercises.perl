#! /usr/bin/perl

use v5.10;
use Storable;

say '[1]';

$all = "**all machine**";
$data_file = 'test2.txt';

%total_byte;
if (-e $data_file) {
  $data = retrieve $data_file;
  %total_byte = %$data;
}

while(<>){
  next if /^#/;
  ($source, $destination, $bytes) = split;

  $total_byte{$source}{$destination} += $bytes;
  $total_byte{$source}{$all} += $bytes;
}

store \%total_byte, $data_file;
