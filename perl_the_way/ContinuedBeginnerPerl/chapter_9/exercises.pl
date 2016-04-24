#! /usr/bin/perl

use v5.10;
use strict;
use Benchmark qw(timethese);

say '[1]';

my @sported = 
  map $_->[0],
  sort { $a->[1] <=> $b->[1] }
  map [$_, -s $_],
  glob "/bin/*";
say @sported;

say '[2]';

my @files = glob "/bin/*";

timethese ( -2, {
  Orginary => q{
    my @results = sort {-s $a <=> -s $b } @files;
  },
  Schwartzian => q{
    my @sorted =
      map $_->[0],
      sort { $a->[1] <=> $b->[1] }
      map [$_, -s $_],
      @files;
  },
});

say '[3]';

my @input_list = qw/home key tv cd/;
my @dictionary = 
  map $_->[0],
  sort { $a->[1] cmp $b->[1] }
  map {
    my $str = $_;
    $str =~ tr/A-Z/a-z/;
    $str =~ tr/a-z//cd;
    [ $_, $str ];
  } @input_list;
say @dictionary;

say '[4]';

sub data_for_path {
  my $path = shift;
  if (-f $path or -l $path) {
    return undef;
  }
  if (-d $path) {
    my %dir;
    opendir PATH, $path or die "can't open $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name (@names) {
      next if $name eq "." or $name eq "..";
      $dir{$name} = data_for_path("$path/$name");
    }
    return \%dir;
  }
  warn "$path is nor dir\n";
  return undef;
}

sub dump_data_for_path {
  my $path = shift;
  my $data = shift;
  my $prefix = shift || "";

  print "$prefix$path";
  if (not defined $data) {
    print "\n";
    return;
  }
  my %dir = %$data;
  if (%dir) {
    print ", with contents of:\n";
    for (sort keys %dir) {
      dump_data_for_path($_, $dir{$_}, "$prefix  ");
    }
  } else {
    print ", an empty dir\n";
  }
}
dump_data_for_path(".", data_for_path("."));
