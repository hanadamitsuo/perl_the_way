#! /usr/bin/perl

use v5.10;
use strict;

warn "navigation.pm";
my $ff;

package Navigation;

my @home = (21.283, -157.843);

my @destination = @Navigation::home;
say @destination;
