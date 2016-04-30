#! /usr/bin/perl

use strict;
use v5.10;

{ package Animal;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
}

{ package Horse;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
}

Horse->speak;

my $name = 'Mr. Ed';
my $tv_horse = \$name;

bless $tv_horse, 'Horse2';

my $noise = $tv_horse->sound;
say $noise;

Horse::sound($tv_horse);

{ package Horse2;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }

  sub name {
    my $self = shift;
    $$self;
  }
}

print $tv_horse->name, "says ", $tv_horse->sound, "\n";

{ package Horse3;
  our @ISA = qw(Animal);
  sub sound { 'neigh' }

  sub name {
    my $self = shift;
    $$self;
  }
  sub named {
    my $class = shift;
    my $name = shift;
    bless \$name, $class;
  }
}

my $tv_horse2 = Horse3->named('Mr. Ed');
say $tv_horse2;

{ package Animal2;
  sub speak {
    my $class = shift;
    print "a $class goes ", $class->sound, "!\n";
  }
  sub name {
    my $self = shift;
    $$self;
  }
  sub named {
    my $class = shift;
    my $name = shift;
    bless \$name, $class;
  }
}

{ package Horse4;
  our @ISA = qw(Animal2);
  sub sound { 'neigh' }
}
my $tv_horse3 = Horse4->named('Mr. Ed');
$tv_horse3->speak;

{ package Animal3;
  sub named {
    my $class = shift;
    my $name = shift;
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
}

{ package Horse5;
  our @ISA = qw(Animal3);
  sub sound { 'neigh' }
}
{ package Sheep;
  our @ISA = qw(Animal3);
  sub sound { 'baaaah' }
}

my $tv_horse4 = Horse5->named('Mr. Ed');
$tv_horse4->eat('hay');
Sheep->eat('grass');

my $lost = bless { Name => 'Bo', Color => 'white' }, 'Sheep';
say $lost->{Name};

sub color {
  my $self = shift;
  $self->{Color};
}

sub set_color {
  my $self = shift;
  $self->{Color};
}

sub set_color {
  my $self = shift;
  my $old = $self->{Color};
  $self->{Color} = shift;
  $old;
}

sub set_color {
  my $self = shift;

  if (defined wantarray) {
    my $old = $self->{Color};
    $self->{Color} = shift;
    $old;
  }
  else {
    $self->{Color} = shift;
  }
}

#use Color::Conversions qw(color_name_to_rgb rgb_to_color_name);

sub set_color {
  my $self = shift;
  my $new_color = shift;
  $self->{Color} = color_name_to_rgb($new_color);
}
sub color {
  my $self = shift;
  rgb_to_color_name($self->{Color});
}

sub color {$_[0]->{Color}}
sub set_color { $_[0]->{Color} = $_[1] }

sub color {
  my $self = shift;
  if (@_) {
    $self->{Color} = shift;
  } else {
    $self->{Color};
  }
}

use Carp qw(croak);

sub instance_only {
  ref(my $self = shift) or croak "instance variable needed";
}

sub class_only {
  ref(my $class = shift) and croak "class name needed";
}
