#! /usr/bin/perl

use strict;
use v5.10;

#while (<STDIN>) {
#  say $_;
#}

#my $line;
#while (defined($line = <>)) {
#  chomp($line);
#  say "$lineだよ。";
#}

#while (<>){
#  chomp;
#  say "$_だよ。";
#}

#@ARGV = qw# io.perl io2.perl #;
#while (<>) {
#  chomp;
#  say "$_だよ。";
#}

my @array = qw/ aa ss dd ff /;
print @array;
print "@array";

my $user = "suzuki";
my $day = 10;
printf "hello, %s; your passwd in %d days!\n", $user, $day;

printf "%g %g %g", 5/2, 51/17, 51**17;
printf "%10s\n", "yamato";

my @ar = qw /aa ss dd/;
#my $str = "hello\n".("%10s\n" x @ar);
#print $str;
#printf $str, @ar;

#printf "hello:\n".("%10s\n" x @ar), @ar;
printf "hello:\n"."%10s\n", @ar;

#while (<STDIN>) {
#  <STDOUT>;
#}

open CONFIG, 'io.perl';
open CONFIG, '<io.perl';
open BEDROCK, '>io2.perl';

my $ask = "haahhahah";
#open LOG, '>>io3.perl';
#open LOG, '< $ask1';
open LOG, 'io3.perl';
print LOG $ask;

my $io = open CONFIG, '>> ', 'io.perl';

warn "警告だよ";
#my @tom = <STDIN>;
#if (@ARGV < 2) {
#  die "エラー $!です。";
#}

my $gg = <STDIN>;
open GG, '>>io3.perl';
print GG $gg;
close GG;
