package Animal;

use strict;

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
sub color { 'red'; }

1;
