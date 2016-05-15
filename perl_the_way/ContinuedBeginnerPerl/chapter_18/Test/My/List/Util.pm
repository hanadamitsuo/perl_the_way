package Test::My::List::Util;

use strict;

use base qw(Exporter);
use vars qw(@EXPORT $VERSION);

use Exporter;
use Test::Builder;

my $Test = Test::Builder->new();

$VERSION = '0.10';
@EXPORT = qw(sum_ok);

sub sum_ok {
  my ($actual, $expected) = @_;

  if($actual == $expected) {
    $Test->ok(1)
  }
  else {
    $Test->diag(
      "The sum is not right\n",
      "\tGot: $actual\n",
      "\tExpected: $expected\n",
    );
    $Test->ok(0)
  }
}

1;
