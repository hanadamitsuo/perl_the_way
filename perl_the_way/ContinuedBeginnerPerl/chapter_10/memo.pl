#! /usr/bin/perl

use v5.10;
use strict;

sub turn_toward_heading {
  my $new_heading = shift;
  my $current_heading = current_heading();

  print "current_heading is", $current_heading, ".\n";
  print "Come about to $new_heading\n";

  my $dir = 'right';
  my $turn = ($new_heading - $current_heading) % 360;

  if ($turn > 180) {
    $turn = 360 - $turn;
    $dir = 'left';
  }
  print "by turning $dir $turn degrees.\n";
}

sub current_heading{ return 360; };

turn_toward_heading();

sub turn_toward_heading2 {
  my $new_heading = shift;
  my $current_heading = current_heading2();

  print "current_heading is", $current_heading, ".\n";

  my $dir = 'right';
  my $turn = ($new_heading - $current_heading) % 360;

  unless ($turn) {
    print "On course (good job).\n";
    return;
  }

  print "Come about to $new_heading\n";

  if ($turn > 180) {
    $turn = 360 - $turn;
    $dir = 'left';
  }
  print "by turning $dir $turn degrees.\n";
}

sub current_heading2{ return 360; };

turn_toward_heading2();

sub load_common_subroutines {
  open MORE_CODE, 'navigation.pm' or die "navigation.pm: $!";
  undef $/;
  my $more_code = <MORE_CODE>;
  close MORE_CODE;
  eval $more_code;
  die $@ if $@;
}
load_common_subroutines();

sub load_common_subroutines2 {
  open MORE_CODE, 'navigation.pm' or die "navigation.pm: $!";
  undef $/;
  my $more_code = <MORE_CODE>;
  close MORE_CODE;
  do 'navigation.pm';
  die $@ if $@;
}
load_common_subroutines2();

sub load_common_subroutines3 {
  open MORE_CODE, 'navigation.pm' or die "navigation.pm: $!";
  undef $/;
  my $more_code = <MORE_CODE>;
  close MORE_CODE;
  do 'drop_anchor.pm';
  die $@ if $@;
}
load_common_subroutines3();

sub load_common_subroutines4 {
  open MORE_CODE, 'navigation.pm' or die "navigation.pm: $!";
  undef $/;
  my $more_code = <MORE_CODE>;
  close MORE_CODE;
  require 'drop_anchor.pm';
  require 'navigation.pm';
}
load_common_subroutines4();

unshift @INC, '/home/skipper/perl-lib';

BEGIN {
  unshift @INC, '/home/skipper/perl-lib2';
};

use lib qw(/home/skipper/perl-lib3);
