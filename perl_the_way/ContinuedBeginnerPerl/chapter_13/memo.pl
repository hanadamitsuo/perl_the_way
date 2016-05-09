#! /usr/bin/perl

use v5.10;
use strict;


{ package Animal;
  use File::Temp qw(tempfile);
  sub named {
    my $class = shift;
    my $name = shift;
    my $self = { Name => $name, Color => $class->default_color };
    my ($fh, $filename) = tempfile( );
    $self->{temp_fh} = $fh;
    $self->{temp_filename} = $filename;
    bless \$name, $class;
  }
  sub name {
    my $either = shift;
    ref $either
      ? $$either
      : "an unnamed $either";
  }
  sub speak {
    my $either = shift;
    print $either->name, ' goes ', $either->sound, "!\n";
  }
  sub eat {
    my $either = shift;
    my $food = shift;
    print $either->name, " eats $food,\n";
  }
  sub DESTROY {
    my $self = shift;
    my $fh = $self->{temp_fh};
    close $fh;
    unlink $self->{temp_filename};
    print '[', $self->name, "has died.]\n";
  }
  sub default_color { 'red'; }
}

{ package Cow;
  our @ISA = qw(Animal);
  sub sound { 'mooo' };
}

sub feed_a_cow_named {
  my $name = shift;
  my $cow = Cow->named($name);
  $cow->eat('grass');
  print "Returning from the subroutine. \n";
}

print "Start of program.\n";
my $outer_cow = Cow->named('Bessie');
print "Now have a cow named ", $outer_cow->name, "\n";
feed_a_cow_named('Gwen');
print "Returned from sub.\n";

{ package Barn;
  sub new { bless [ ], shift }
  sub add { push @{+shift}, shift }
  sub contents { @{+shift} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destoyed..\n";
    for ($self->contents) {
      print '', $_->name, "goes homeless.\n";
    }
  }
}

my $barn = Barn->new;
$barn->add(Cow->named('Bessie'));
$barn->add(Cow->named('Gwen'));
say "Burn the barn";
$barn = undef;
say "End of program";

{ package Barn2;
  sub new { bless [ ], shift }
  sub add { push @{+shift}, shift }
  sub contents { @{+shift} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destoyed..\n";
    while (@$self) {
      my $homeless = shift @$self;
      print '', $homeless->name, "goes homeless.\n";
    }
  }
}

my $barn2 = Barn2->new;
$barn2->add(Cow->named('Bessie'));
$barn2->add(Cow->named('Gwen'));
say "Burn the barn";
$barn2 = undef;
say "End of program";

{ package Animal2;
  our %REGISTRY;
  sub named {
    my $class = shift;
    my $name = shift;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
    $REGISTRY{$self} = $self;
  }
  sub name {
    my $either = shift;
    ref $either
      ? $either->{Name}
      : "an unnamed $either";
  }
  sub speak {
    my $either = shift;
    print $either->name, ' goes ', $either->sound, "!\n";
  }
  sub eat {
    my $either = shift;
    my $food = shift;
    print $either->name, " eats $food,\n";
  }
  sub reqistered {
    return map { 'a '.ref($_)." named ".$_->name } values %REGISTRY;
  }
  sub DESTROY {
    my $self = shift;
    print '[', $self->name, "has died.]\n";
  }
  sub default_color { 'red'; }
}

{ package Horse;
  our @ISA = qw(Animal2);
  sub sound { 'neigh' }
  sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY;
    print '[', $self->name, "has goes off to the glue factory.]\n";
  }
}

my @tv_horses = map Horse->named($_), ('Trigger', 'Mr. Ed');
$_->eat('an apple') for @tv_horses;
print "End of program.\n";

{ package RaceHorse;
  our @ISA = qw(Horse);
  sub named {
    my $self = {};
    $self = shift->SUPER::named(@_);
    $self->{$_} = 0 for qw(wins places shows losses);
    $self;
  }
  sub won { shift->{wins}++; }
  sub placed { shift->{places}++; }
  sub showed { shift->{shows}++; }
  sub lost { shift->{losses}++; }
  sub standings {
    my $self = shift;
    join ',', map "$self->{$_}", qw(wins places shows losses);
  }
}

my $racer = RaceHorse->named('Billy Boy');

$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, ' has standings of: ', $racer->standings, "\n";


{ package Horse2;
  our @ISA = qw(Animal2);
  sub sound { 'neigh' }
  sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY;
    print '[', $self->name, "has goes off to the glue factory.]\n";
  }
}

{ package Cow2;
  our @ISA = qw(Animal2);
  sub sound { 'mooo' };
}

my @cows = map Cow2->named($_), qw(Bessie Gwen);
my @horses = map Horse2->named($_), ('Trigger', 'Mr. Ed');
my @racehorses = RaceHorse->named('Billy Boy');
print "We seen:\n", map(" $_\n", Animal2->reqistered);
say "END";

