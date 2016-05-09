#! /usr/bin/perl

#use Island::Plotting::Maps qw( load_map scale_map draw_map );
#
#BEGIN {
#  require Island::Plotting::Maps;
#  Island::Plotting::Maps->import( oad_map scale_map draw_map );
#}

{ package File::Basename;

  sub dirname {}
  sub basename {}
  sub fileparse {}
  1;
}

sub import {
  no strict 'refs';
  for (qw(filename basename fileparse)) {
    *{"main::$_"} = \&$_;
  }
}

{ package File::Basename;
  our @EXPORT = qw(filename basename fileparse);
  use base qw(Exporter);
}

use File::Basename;

BEGIN { require File::Basename; File::Basename->import}

#use Navigate::SeatOfPants;
#use Navigate::SeatOfPants qw(guess_direction_toward);
#use Navigate::SeatOfPants qw(ask_the_skipper_about get_north_from_professor);

use Fcntl qw(:flock);

#use Navigate::SeatOfPants qw(:DEFAULT);
#use Navigate::SeatOfPants qw(:DEFAULT get_north_from_professor);

{ package Navigate::SeatOfPants;

  use base qw(Exporter);

  our @EXPORT = qw(guess_direction_toward);
  our @EXPORT_OK = qw(
                      ask_the_skipper_about
                      get_north_from_professor
                      according_to_GPS
                    );

  our %EXPORT_TAGS = (
    all => [@EXPORT, @EXPORT_OK],
    gps => [ qw (according_to_GPS)],
    direction => [ qw (
                      ask_the_skipper_about
                      get_north_from_professor
                      according_to_GPS
                      guess_direction_toward
                  )],
  );
}

#package My::OOModule::Base;
#our @EXPORT = ();
#use base qw(Exporter);

#package My::OOModule::Derived;
#use base qw(My::OOModule::Base);

#use URI::URL;
#my $u = URI::URL->new('http://www.gilligan.crew,hut/map/island.pdf');

use CGI;
my $q = CGI->new;
my $f = $q->param('foo');

use CGI qw(param);
my $f = param('foo');

use CGI qw(:all);
my $f = param('foo');

use CGI qw(-nosticky :all);

use CGI qw(-nosticky :all *table);


sub import {
  no strict 'refs';
  for (qw(filename basename fileparse)) {
    *{"main::$_"} = \&$_;
  }
}

sub import {
  no strict 'refs';
  my $package = caller;
  for (qw(filename basename fileparse)) {
    *{$packge."::$_"} = \&$_;
  }
}

sub import {
  no strict 'refs';
  my ($package,$file, $line) = caller;
  warn "I was called by $packge in $file\n";
  for (qw(filename basename fileparse)) {
    *{$packge."::$_"} = \&$_;
  }
}

sub import {
  no strict 'refs';
  my $debug = grep { $_ eq 'debug'} @_;
  my ($package,$file, $line) = caller;
  warn "I was called by $packge in $file\n";
  for (qw(filename basename fileparse)) {
    *{$packge."::$_"} = \&$_;
  }
}
