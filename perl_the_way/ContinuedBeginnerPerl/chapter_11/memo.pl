#! /usr/bin/perl

use v5.10;
#use strict;

sub Cow::speak {
  print "a Cow goes mooo!\n";
}

sub Horse::speak {
  print "a Hore goes night!\n";
}

sub Sheep::speak {
  print "a Sheep goes baaaah!\n";
}

Cow::speak;
Horse::speak;
Sheep::speak;

my @pasture = qw(Cow Cow Horse Sheep Sheep);
foreach my $best (@pasture) {
  &{$best."::speak"};
}

Cow->speak;
Horse->speak;
Sheep->speak;

my $beast = 'Cow';
$beast->speak;

my @pasture2 = qw(Cow Cow Horse Sheep Sheep);
foreach my $best2 (@pasture2) {
  $best2->speak;
}

sub Sheep::speak {
  my $class = shift;
  print "a $class goes baaah\n";
}

sub Cow::speak {
  my $class = shift;
  print "a $class goes mooon\n";
}

sub Hores::speak {
  my $class = shift;
  print "a $class goes neght\n";
}

{ package Cow;
  sub sound { 'moooo' }
  sub speak {
    my $class = shift || 'Cow';
    print "a $class goes ", $class->sound, "!\n";
  }
}

Cow->speak;

{ package Horse;
  sub sound { 'night' }
  sub speak {
    my $class = shift || 'Horse';
    print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Cow;
  @ISA = qw(Animal);
  sub sound { "moooo" }
}

Animal::speak('Cow');
