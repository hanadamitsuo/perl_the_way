#! /usr/bin/perl

use v5.10;
use strict;

do "navigation.pm";
die $@ if $@;

my $newheading = 300;

turn_toward_heading($newheading);
