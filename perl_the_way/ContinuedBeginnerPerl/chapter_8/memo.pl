#! /usr/bin/perl

use v5.10;
use strict;

log_massage( *Log_FH, 'the global are whith me');

sub log_massage {
  local *FH = shift;
  say FH @_;
}

my $log_fh;
open $log_fh, '>> castaways.log' or die "Could not open castaways.log";

my $log_fh2;
open $log_fh2, '>> castaways.log' or die "Could not open castaways.log: $!";

print {$log_fh2} "we have no bananas";

&log_massage2($log_fh2, 'My name is Mr.Ed');

sub log_massage2 {
  my $fh = shift;
  print $fh @_,"\n";
}

use IO::File;

my $fh = IO::File->new( '> cataways.log') or die "Colud not create: $!";
say $fh;

my $read_fh = IO::File->new('cataways.log', 'r');
say $read_fh;

my $write_fh = IO::File->new('cataways.log', 'w');
say $write_fh;

my $apped_fh = IO::File->new('cataways.log', O_WRONLY|O_APPEND);
say $apped_fh;

my $temp_fh = IO::File->new_tmpfile;
say $temp_fh;

my @handlepairs;

foreach my $file ( glob('*.input')) {
 (my $out = $file) =~ s/\.input$/.output/;
  push @handlepairs, [
    (IO::File->new("<$file") || die),
    (IO::File->new(">$out") || die),
  ];
}
say @handlepairs;

while (@handlepairs) {
  @handlepairs = grep {
    my ($IN, $OUT) = @$_;
    if (defined(my $line = <$IN>)) {
      say $OUT $line;
    } else {
      0;
    }
  } @handlepairs;
}
say @handlepairs;

while (@handlepairs) {
  @handlepairs = grep {
    my ($IN, $OUT) = @$_;
    my $line;
    defined($line = <$IN>) and print $OUT $line;
  } @handlepairs;
}
say @handlepairs;

use IO::Scalar;

my $str = '';
my $scalar = IO::Scalar->new(\$str);

print $scalar "the hello private beach\n";

while (<$scalar>) {
  next unless /Gilliagn/;
  print;
}

my $str2 = '';

open my $log_fh3, '>>', 'castaways.log' or die "Could not open log";
open my $scalar_fh, '>>', \$str2;

use IO::Tee;

my $tee_fh = IO::Tee->new($log_fh3, $scalar_fh);
print $tee_fh "the radio work in the middle of the ocean\n";
say $tee_fh;

use IO::Dir;

my $dir = IO::Dir->new('.') || die "Could not open";

while (defined(my $file = $dir->read)) {
  print "SKipper, I found $file!\n";
}
