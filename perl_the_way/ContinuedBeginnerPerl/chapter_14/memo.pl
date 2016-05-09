#! /usr/bin/perl

use strict;
use v5.10;
use Carp 'croak';

{ package Animal;
  our %REGISTRY;

  sub AUTOLOAD {
    my @elements = qw(color age weight height);
    our $AUTOLOAD;
    if ($AUTOLOAD =~ /::(\w+)$/ and grep $1 eq $_, @elements) {
      my $field = ucfirst $1;
      {
        no strict 'refs';
        *{$AUTOLOAD} = sub { $_[0]->{field} };
      }
      goto &{$AUTOLOAD};
    }

    (my $method = $AUTOLOAD) =~ s/.*:://s;
    if ($method eq "eat") {
      eval q{
        sub eat {
          my $either = shift;
          my $food = shift;
          print $either->name, " eats $food,\n";
        }
      };
      die $@ if $@;
      goto &eat;
    } else {
#      croak "$_[0] does not know how to $meth\n";
    }
  }

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

sub UNIVERSAL::fandango {
  warn 'object ', shift, " can do the fandango!\n";
}

if (Horse->isa('Animal')) {
  print "A Horse is an Animal.\n";
}

my $tv_horse = Horse->named("Mr. Ed");
if ($tv_horse->isa('Animal')) {
  say $tv_horse->name, "is an Animal";
  if($tv_horse->isa('Horse')) {
    say "In fact",$tv_horse->name,"is an Horse";
  } else {
    say "...but it's not a Horse";
  }
}

my @all_animal = qw/Horse Animal/;
my @horses = grep $_->isa('Horse'), @all_animal;
say @horses;

if ($tv_horse->can('eat')) {
  $tv_horse->eat('hay');
}

if ($tv_horse->can('fandango')) {
  $tv_horse->eat('hay');
}

{ package Animal;
  use Class::MethodMaker
    new_with_init => 'new'.
    get_set => [-eiffel => [qw(color height name age)]],
    abstract => [qw(sound)],
  ;

  sub init {
    my $self = shift;
    $self->set_color($self->default_color);
  }
  sub named {
    my $self = shift->new;
    $self->set_name(shift);
  }
  sub speak {
    my $self = shift;
    print $self->name, 'goes', $self->sound, "\n";
  }
  sub eat {
    my $self = shift;
    my $food = shift;
    print $self->name, 'eats', $food, "\n";
  }
  sub default_color {
    'brown';
  }
}
