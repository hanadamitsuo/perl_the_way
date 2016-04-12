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

$ginger = sub {
  my $person = shift;
  print "Ginger: hello $person\n";
};
$ginger->('Skiper');
say "$ginger";

%greets3 = (

  Skipper => sub {
    my $person = shift;
    print "Skipper: hey $person\n";
  },

  Gilligan => sub {
    my $person = shift;
    if ($person eq 'Skipper') {
      print "Gilligan:sir $person\n";
    } else {
      print "Gilligan: Hi $person\n";
    }
  },

  Professor => sub {
    my $person = shift;
    print "Professor:hello $person\n";
  },

  Ginger => sub {
    my $person = shift;
    print "Ginger:hello $person\n";
  },
);

@room2;
for $person (qw(Gilligan Skipper Professor)) {
  print "\n";
  print "$person walk into the room\n";

  for $room (@room2) {
    $greets2{$person}->($room);
    $greets2{$room}->($person);
  }
  push @room2, $person;
}
say "@room2";

use File::Find;

sub what_to_do {
  print "$File::Find::name found\n"
}
my @starting = qw(.);

find(\&what_to_do, @starting);

@starting2 = qw(.);

find(
  sub {
    say "$File::Find::name found\n";
  },
  @starting2,
);

my %callback;
{
  my $count = 0;
  $callback = sub { print ++$count, ": $File::Find::name\n"};
}
find($callback, '.');

sub create_find_callback_that_counts {
  my $count = 0;
  return sub { print ++$count, ": $File::Find::name\n"};
}

my $callback2 = create_find_callback_that_counts();
find($callback2, '.');

print "my bin:\n";
find($callback2, 'bin');
print "my lib:\n";
find($callback2, 'lib');

sub create_find_callback_that_sums_size {
  my $total_size = 0;
  return sub { 
    if (@_) {
      return $total_size;
    } else {
      $total_size += -s if -f;
    }
  };
}

$call = create_find_callback_that_sums_size();
find($call, 'bin');
my $total_size = $call->('dummy');
say "total size is $total_size";

sub create_find_callbacks_that_sum_the_size {
  my $total_size = 0;
  return(sub { $total_size += -s if -f}, sub{ return $total_size });
}

my %subs;
foreach my $dir  (qw/bin lib man/) {
  my ($callback, $getter) = create_find_callbacks_that_sum_the_size();
  $subs{$dir}{CALLBACK}   = $callback;
  $subs{$dir}{GETTER}     = $getter;
}

for (keys %subs) {
  find($subs{$_}{CALLBACK},$_);
}

for (sort keys %subs) {
  my $sum = $subs{$_}{GETTER}->();
  print "$_ has $sum\n";
}

sub print_bigger_than {
  my $minimum_size = shift;
  return sub {say "$File::Find::name\n" if -f and -s >= $minimum_size};
}

my $bigger = print_bigger_than(1024);
find($bigger, 'bin');

{
  my $count;
  sub count_one { ++$count }
  sub count_so_far { return $count}
}

count_one();
count_one();
count_one();
print 'we have', count_so_far(), "counts";

BEGIN {
  $countdown = 10;
  sub count_down { $countdown-- }
  sub count_so_far { $countdown}
}
