#! /usr/bin/perl

use strict;
use v5.10;

say '[1]';

{
  package MyData;
  use vars qw($AUTOLOAD);

  use Carp;

  my %Allowed_methods = qw( data 3 month 4 year 5);
  my @offsets         = qw(0 0 0 0 1 1900 0 0 0);

  sub new {bless {}, $_[0]}
  sub DESTROY {}

  sub AUTOLOAD {
    my $method = $AUTOLOAD;
    $method =~ s/.*:://;

    unless( exists $Allowed_methods{$method}) {
      carp "Unknown method: $AUTOLOAD";
      return;
    }
    my $slice_index = $Allowed_methods{ $method };

    return (localtime)[$slice_index] + $offsets[$slice_index];
  }
}

MyData->import;
my $data = MyData->new();

say "the data is". $data->data;
say "the month is". $data->month;
say "the year is". $data->year;

say '[2]';

sub UNIVERSAL::debug {
  my $self = shift;
  printf "[%s] %s", scalar localtime, join '|', @_;
}

say "the data is". $data->data;
say "the month is". $data->month;
say "the year is". $data->year;

$data->debug("I'm all done");
