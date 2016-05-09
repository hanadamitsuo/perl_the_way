#! /usr/bin/perl

use strict;
use warning;

require Exporter;
our @ISA = qw(Exporter);

use base qw(Geo::Maps);

our %EXPORT_TAGS = ( 'all' => [ qw()]);

#use Island::Plotting::Maps;

our $VERSION = '0.01';

#use Island::Plotting::Maps 1.10 qw{ map_dubugger };
