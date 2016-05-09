package My::List::Util;

use strict;

use base qw(Exporter);
use vars qw(@EXPORT $VERSION);

use Exporter;

$VERSION = '0.10';
@EXPORT = qw(sum shuffle);

sub shuffle {
  my $deck = shift;
  my $i = @$deck;
  while ($i--) {
    my $j = int rand ($i+1);
    @$deck[$i,$j] = @$deck[$j,$i];
  }
}

sub sum {
  my @array = @_;
  my $sum = 0;

  foreach my $element (@array) {
    $sum += $element;
  }
  $sum;
}

1;
