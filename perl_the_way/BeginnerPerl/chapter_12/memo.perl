#! /usr/bin/perl

use v5.10;

$file_name = "test.txt";
#die "file called '$file_name' already exists" if -e $file_name;

@file = (test.txt,test2.txt,test3.txt);
@old_file;
foreach $file (@file) {
  push @old_file, $file if -s $file < 100 and -A $file < 90;
}
say @old_file;

foreach $file (@file) {
  push @old_file, $file if -r $file and -w $file;
}
say @old_file;

foreach $file (@file) {
  push @old_file, $file if -r $file and -w _;
}
say @old_file;

if (-r $file_name) {
  say "OK!";
}
if (-w _) {
  say "OK!!";
}

$new_file;
if (-r $file_name) {
  say "OK!!!";
}
-s $new_file;
if (-w _) {
  say "OK!!!!";
}
