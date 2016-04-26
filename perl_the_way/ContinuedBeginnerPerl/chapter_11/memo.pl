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

{ package Cow2;
  sub sound2 { 'moooo' }
  sub speak2 {
    my $class = shift;
    print "a $class goes ", $class->sound2, "!\n";
  }
}

Cow2->speak2();

{ package Horse2;
  sub sound2 { 'night' }
  sub speak2 {
    my $class = shift || 'Horse';
    print "a $class goes ", $class->sound2, "!\n";
  }
}

{ package Animal2;
  sub speak2 {
    my $class = shift;
    print "a $class goes ", $class->sound2, "!\n";
  }
}

{ package Cow3;
  @ISA = qw(Animal2);
  sub sound2 { "moooo" }
}

Animal2::speak2('Cow3');

@cow::ISA = qw(Animal);

package Cow4;
#our @ISA qw(Animal2);

package Cow5;

#use Animal3;
use vars qw(@ISA);
@ISA = qw(Animal3);

package Cow6;
use base qw(Animal2);

{ package Animal5;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Mouse;
  @ISA = qw(Animal5);
  sub sound { 'squeak' }
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
    print "[but you can barely hear it!]\n";
  }
}

Mouse->speak;

{ package Mouse2;
  @ISA = qw(Animal5);
  sub sound { 'squeak' }
  sub speak {
    my $class = shift;
    Animal5::speak($class);
    print "[but you can barely hear it!]\n";
  }
}

Mouse2->speak;

{ package Mouse3;
  @ISA = qw(Animal5);
  sub sound { 'squeak' }
  sub speak {
    my $class = shift;
    $class->Animal5::speak(@_);
    print "[but you can barely hear it!]\n";
  }
}

Mouse3->speak;


{ package Animal6;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Mouse4;
  @ISA = qw(Animal6);
  sub sound { 'squeak' }
  sub speak {
    my $class = shift;
    $class->SUPER::speak;
    print "[but you can barely hear it!]\n";
  }
}

Mouse4->speak;

#my $beast2 = 'Class';
#$beast2->method(@args);

#class::method('Class', @args);
