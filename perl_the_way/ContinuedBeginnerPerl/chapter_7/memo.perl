#! /usr/bin/perl

use v5.10;

sub skipper_greets {
  $person = shift;
  say "Skipper: $person";
}

sub gilligan_greets {
  $person = shift;

  if ($person eq "Skipper") {
    say "Gilligan: $person";
  }
  else {
    say "Gilligan: $person";
  }
}
skipper_greets("Gilligan");
gilligan_greets("Skipper");

sub professor_greets {
  $person = shift;
  say "Professor: $person";
}

professor_greets('Gilligan');
professor_greets('Skipper');

$ref_greet = \& skipper_greets;

& skipper_greets ('Gilligan');
& {$ref_greet} ('Gilligan');

$ref_greet->('Gilligan');

%greets = (
  Gilligan => \&gilligan_greets,
  Skipper  => \&skipper_greets,
  Professor => \&professor_greets,
);

for (qw/ Skipper Gilligan /){
  $greets{$_}->('Professor');
}
say %greets;

@everyone = sort keys %greets;
for $greeter (@everyone) {
  for $greeted (@everyone) {
    $greets{$greeter}->($greeted) unless $greeter eq $greeted;
  }
}
say %greets;

sub skipper_greets2 {
  my $person = shift;

  say "Skipper: $person";
}

sub gilligan_greets2 {
  my $person = shift;

  if ($person eq "Skipper") {
    say "Gilligan: $person";
  }
  else {
    say "Gilligan: $person";
  }
}

sub professor_greets2 {
  my $person = shift;

  say "Professor: $person";
}

%greets2 = (
  Gilligan => \&gilligan_greets2,
  Skipper  => \&skipper_greets2,
  Professor => \&professor_greets2,
);

@room;
for $person (qw(Gilligan Skipper Professor)) {
  print "\n";
  print "$person walk into the room\n";

  for $room (@room) {
    $greets2{$person}->($room);
    $greets2{$room}->($person);
  }
  push @room, $person;
}
say @room;
