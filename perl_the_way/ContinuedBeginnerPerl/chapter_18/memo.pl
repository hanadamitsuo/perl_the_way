#! /usr/bin/perl

use strict;
use v5.10;

use Test::More 'no_plan';
is( "Hello perl", "Hello perl");

use Test::LongString;

is_string(
  "The quick brown fox jumped over the lazy dog\n" x 10,
  "The quick brown fox jumped over the lazy dog\n" x 9,
  "The quick brown fox jumped over the lazy camel",
);

ok( -e 'minnow.db');

use Test::File;

file_exists_ok('minnow.db');

file_not_exists_ok('minnow.db');

my $file = 'minnow.db';

file_exists_ok($file);
file_not_empty_ok($file);
file_readable_ok($file);
file_min_size_ok($file,500);
file_mode_is($file,0775);

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

use_ok 'Horse';
isa_ok(my $trigger = Horse->named('Trigger'), 'Horse');

open STDOUT, "test.out" or die "cant STDOUT! $!";
  $trigger->eat("hay");
close STDOUT;

open T, "test.out" or die "cant STDOUT! $!";
  my @contents = <T>;
close T;
is(join("",@contents), "Trigger eats hay\n","Trigger ate properly");

END { unlink "test.out" }

use Test::Output;

sub print_hello { print STDOUT "Welcome Aboard\n" }
sub print_error { print STDER "Theres a hole in the ship" }

stdout_is( \&print_hello, "Welocome Aboard\n");
stderr_like( \&print_error, qr/ship/);

stdout_is( sub { print_hello, "Welocome Aboard\n"}, "Welcome Aboard");

use Test::Warn;

sub add_letters { "Skipper" + "Gilligan" }

use Test::NoWarnings;

my ($n, $m);
my $sum = $n + $m;

use Test::MockObject;

my $Minnow = Test::MockObject->new();

$Minnow->set_true( 'engines_on' );
$Minnow->set_true( 'has_maps' );
$Minnow->set_true( 'moored_to_dock' );

ok( $Minnow->engines_on, "English are on" );
ok ( ! $Minnow->moored_to_dock, "Not moored to the dock");

my $Quartermaster = Island::Plotting->new();

ok($Quartermaster->has_maps, "We can find the maps" );

my $db = Test::MockObject->new();

$db->mock( list_names => sub { qw( Gilligan Skipper Professor )});

my @named = $db->list_names;

is( scalar @named, 3, 'Got the right number of result');
is( $named[0], 'Gilligan', 'The first result is Gilligan');

print "the name are @named\n";
