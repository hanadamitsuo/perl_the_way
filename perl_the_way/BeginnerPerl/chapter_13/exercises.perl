#! /usr/bin/perl

use v5.10;

say '[1]';

#chomp($dir = <STDIN>);
#if ($dir =~ /^\s*$/) {
#  chdir or die "can't chdir";
#}
#else {
#  chdir $dir or die "can't chidir '$dir' : $!";
#}
#
#@file = <*>;
#foreach (@file) {
#  say "$_";
#}

say '[2]';

#chomp($dir = <STDIN>);
#if ($dir =~ /^\s*$/) {
#  chdir or die "can't chdir";
#}
#else {
#  chdir $dir or die "can't chidir '$dir' : $!";
#}
#
#@file = <.* *>;
#foreach (sort @file) {
#  say "$_";
#}

say '[3]';

#chomp($dir = <STDIN>);
#if ($dir =~ /^\s*$/) {
#  chdir or die "can't chdir";
#}
#else {
#  chdir $dir or die "can't chidir '$dir' : $!";
#}
#
#opendir DOT, "." or die "can't open : $!";
#foreach (sort readdir DOT) {
#  say "$_";
#}
#closedir DOT;

say '[4]';

#unlink @ARGV;

say '[5]';

use File::Basename;
use File::Spec;
#
#($source, $dest) = @ARGV;
#
#if (-d $dest) {
#  $basename = basename $source;
#  $dest = File::Spec->catfile($dest, $basename);
#}
#
#rename $source, $dest or die "can't rename '$source' to '$dest': $!\n";

say '[6]';

#($source, $dest) = @ARGV;
#
#if (-d $dest) {
#  $basename = basename $source;
#  $dest = File::Spec->catfile($dest, $basename);
#}
#
#link $source, $dest or die "can't rename '$source' to '$dest': $!\n";

say '[7]';

#$symlink = @ARGV[0] eq -q '-s';
#shift @ARGV if $symlink;
#
#($source, $dest) = @ARGV;
#if (-d $dest) {
#  $basename = basename $source;
#  $dest = File::Spec->catfile($dest, $basename);
#}
#
#if ($symlink) {
#  symlink $source, $dest or die "can't make soft link";
#}
#else {
#  link $source, $dest or die "can't make soft link";
#}

say '[8]';

foreach (glob('.* *')) {
  $dest = readlink $_;
  say "$_ -> $dest" if defined $dest;
}
