#! /usr/bin/perl

use strict;
use v5.10;

{ package Animal;
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
  our @ISA = qw(Animal);
  sub sound { 'neigh' }
  sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY;
    print '[', $self->name, "has goes off to the glue factory.]\n";
  }
}

{ package ReceHorse;
  our @ISA = qw(Horse);

  dbmopen (our %STANDING, "standings", 066)
    or die "Cannot acces standings dbm: $!";
  
  sub named {
    my $self = shift->SUPER::named(@_);
    my $name = $self->name;
    my @standings = split '', $STANDING{$name} || "0 0 0 0";
    @$self{qw(wins place shows losses)} = @standings;
    $self;
  }
  
  sub DESTROY {
    my $self = shift;
    $STANDING{$self->name} = "@$self{qw(wins places shows losses)}";
    $self->SUPER::DESTPROY;
  }
  
  sub won {shift->{wins}++;}
  sub placed {shift->{places}++;}
  sub showed {shift->{shows}++;}
  sub lost {shift->{losses}++;}
  sub standings {
    my $self = shift;
    join ", ", map "$self->{$_} $_", qw(wins places shows losses);
  }
}

my $run = ReceHorse->named('Billy Boy');
$run->won;
print $run->name, 'has standingd', $run->standings,".\n";
