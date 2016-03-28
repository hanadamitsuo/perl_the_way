#! /usr/bin/perl

use v5.10;

say '[1]';

#$str = <STDIN>;
#$what = 'fred|barney';
#if ($str =~ /($what){3}/) {
#  say "OK";
#}

say '[2]';

#$in = @ARGV[0];
#if (! defined $in) {
#  die "Usage: $0 filename";
#}
#
#$out = $in;
#$out =~ s/(\.\w+)?$/.out/;
#
#if(! open $in_fh, '<', $in){
#  die "can't open";
#}
#
#if(! open $out_fh, '>', $out){
#  die "can't write";
#}
#
#while (<$in_fh>) {
#  s/Fred/Larry/gi;
#  say $out_fh $_;
#}

say '[3]';

#$in = @ARGV[0];
#if (! defined $in) {
#  die "Usage: $0 filename";
#}
#
#$out = $in;
#$out =~ s/(\.\w+)?$/.out/;
#
#if(! open $in_fh, '<', $in){
#  die "can't open";
#}
#
#if(! open $out_fh, '>', $out){
#  die "can't write";
#}
#
#while (<$in_fh>) {
#  chomp;
#  s/Fred/\n/gi;
#  s/Wilma/Fred/gi;
#  s/\n/Wilma/g;
#  say $out_fh "$_\n";
#}

say '[4]';

#$^I = ".bak";
#while (<>) {
#  if (/\A#!/) {
#    $_ .= "## Copyright (C) 2016 by Yours Truly\n";
#  }
#  print;
#}

say '[5]';

%do_these;
foreach (@ARGV) {
  $do_these{$_} = 1;
}

while (<>) {
  if (/\A## Copyright/) {
    delete $do_these{$ARGV};
  }
}

@ARGV = sort keys %do_these;
$^I = ".bak";
while (<>) {
  if (/\A#!/) {
    $_ .= "## Copyright (C) 2016 by Yours Truly\n";
  }
  print;
}
