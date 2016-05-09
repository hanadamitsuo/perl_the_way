package Horse;

use strict;
use base qw(Animal);

print Horse->color;
sub sound { 'neigh' }

1;
