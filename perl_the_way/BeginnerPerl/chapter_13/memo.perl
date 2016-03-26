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

unlink 'memo2.perl' or warn "not unlink";

rename 'test.txt', 'test2.txt';

foreach (glob "*.txt") {
  $new_file = $_;
  $new_file =~ /^*2.txt$/;
  if (-e $new_file) {
    warn "can't remane";
  }
  elsif (rename $_ , $new_file) {
    say "OK";
  }
}

symlink 'test', 'test2' or warn "can't symlink";

mkdir 'test4', oct(755);

rmdir 'test4';

$now = time;
say $now;

$ago = $now - 20 * 60 * 60;
say $ago;
