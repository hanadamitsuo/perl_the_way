#! /usr/bin/perl

use v5.10;

say '[1]';

use File::Find;
use Time::Local;
use strict;

my $target_dow = 1;
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my ($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);

while ($dow != $target_dow) {
  $start -= $seconds_per_day;

  if (--$dow < 0){
    $dow += 7;
  }
}
my $stop = $start + $seconds_per_day;

my ($gather, $yield) = gather_mtime_between($start, $stop);

find($gather, @starting_directories);
my @files = $yield->();

for my $file (@files) {
  my $mtime =(stat $file)[9];
  my $when = localtime $mtime;
  print "$when: $file\n";
}

sub gather_mtime_between {
  my ($begin, $end) = @_;
  my $files;
  my $gatherer = sub {
    my $timestamp = (stat $_)[9];
    unless (defined $timestamp) {
      warn "Can't stat $File::Find::name: $!, skipper\n";
      return;
    }
    push @files, $File::Find::name if
      $timestamp >= $begin and $timestamp < $end;
  };
  my $fetcher = sub { @files };
  return ($gatherer, $fetcher);
}
