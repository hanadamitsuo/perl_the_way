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

if (-r -w $file_name) {
  say "both file";
}

if ((-d $file_name and -s ) < 512 ) {
  say "less 512";
}

($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mime, $ctime, $blksize, $blocks) = stat($file_name);
say "$dev";
say "$ino";
say "$mode";
say "$nlink";
say "$uid";
say "$gid";
say "$rdev";
say "$size";
say "$atime";
say "$mime";
say "$ctime";
say "$blksize";
say "$blocks";

$timestamp = 1180630098;
$date = localtime $timestamp;
say $date;
