#! /usr/bin/perl

use v5.10;
use strict;

say '[1]';

#{ package Animal;
#  sub speak {
#    my $class = shift;
#    print "a $class goes ", $class->sound, "!\n";
#  }
#}
#
#{ package Cow;
#  our @ISA = qw(Animal);
#  sub sound { "moooo" }
#}
#
#{ package Horse;
#  our @ISA = qw(Animal);
#  sub sound { "neigh" }
#}
#
#{ package Sheep;
#  our @ISA = qw(Animal);
#  sub sound { "baaah" }
#}
#
#{ package Mouse;
#  our @ISA = qw(Animal);
#  sub sound { "squeak" }
#  sub speak {
#    my $class = shift;
#    $class->SUPER::speak;
#    print "[but you can barely hear it!]\n";
#  }
#}
#
#my @barnyard = ( );
#{
#  print "enter an animal (empty to finish): ";
#  chomp(my $animal = <STDIN>);
#  $animal = ucfirst lc $animal;
#  last unless $animal =~ /^(Cow|Horse|Sheep|Mouse)$/;
#  push @barnyard, $animal;
#  redo;
#}
#
#foreach my $beast (@barnyard) {
#  $beast->speak;
#}

say '[2]';

{ package LivingCreature;
  sub speak {
    my $class = shift;

    if(@_) {
      print "a $class goes '@_' !\n";
    } else {
      print "a $class goes ", $class->sound, "\n";
    }
  }
}

{ package Person;
  our @ISA = qw(LivingCreature);
  sub sound { "hmmm" }
}

{ package Animal;
  our @ISA = qw(LivingCreature);
  sub sound { die "all Animal should define a sound" }
  sub speak {
    my $class = shift;
    die "animals can't talk" if @_;
    $class->SUPER::speak;
  }
}

{ package Cow;
  our @ISA = qw(Animal);
  sub sound { "moooo" }
}

{ package Horse;
  our @ISA = qw(Animal);
  sub sound { "neigh" }
}

{ package Sheep;
  our @ISA = qw(Animal);
  sub sound { "baaah" }
}

{ package Mouse;
  our @ISA = qw(Animal);
  sub sound { "squeak" }
  sub speak {
    my $class = shift;
    $class->SUPER::speak;
    print "[but you can barely hear it!]\n";
  }
}

Person->speak;
Person->speak("Hello, world!");
