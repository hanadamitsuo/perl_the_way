#! /usr/bin/perl

use v5.10;

@all_file = glob '*.perl';
say @all_file;

@all_file2 = <*>;
say @all_file2;

$dir = '/etc';
opendir $dh, $dir or die "cannot open $dir : $!";
foreach (readdir $dh) {
  say "$dir is $_";
}
closedir $dh;

$dir = '/Users/admin/perl/perl_the_way/BeginnerPerl/chapter_5';
opendir $DH, $dir or die "cannot open $dir : $!";
foreach (readdir $DH) {
  if ($_ =~ /\.perl$/) {
    say "$dir is $_";
  }
}
closedir $DH;



