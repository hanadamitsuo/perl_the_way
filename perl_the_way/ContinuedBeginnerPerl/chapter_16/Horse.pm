package Horse;

use strict;
use Exporter;
our @EXPORT = qw(sound);
our @ISA = pw(Exporter Animal);

sub sound { 'neigh' }

1;
