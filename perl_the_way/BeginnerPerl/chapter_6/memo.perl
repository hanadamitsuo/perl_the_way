#! /usr/bin/perl

use v5.10;
use Data::Dumper;

$family_name{'fred'} = 'flintsone';
$family_name{'barned'} = 'rubble';

foreach (qw/fred barned/) {
  say "$family_name{$_}";
}

$foo = 'fr';
print $family_name{ $foo . 'ed' };

$family_name{'fred'} = 'abort';
say $family_name{'fred'};

$name = $family_name{'aaa'};
say $name;

%some = ('foo', 45,'goo',78.6);
say $some{foo};
@list = %some;
say %some;
say @list;

%hash = reverse %some;
say %hash;

%hashs = (
  'haha'  => 'mama',
  'titi'  => 'papa',
  'diro'  => undef,
  'ken'  => 2,
  'job'  => 4,
);
say $hashs{diro};
say $hashs{ken};

#%lost = (
#  + => 'kom',
#);

$hash{bar.foo} = 10;
say $hash{bar.foo};

%uno = (a => 1, b => 2, c => 3);
@tom = keys %uno;
say @tom;

while (($key, $value) = each %uno) {
  say "$key => $value";
}

foreach (sort keys %uno) {
  $jj = $uno{$_};
  say "$_ => $jj";
}

$book{dino} = "koko";
if (exists $book{dino}) {
  say "hello";
}

$lop{yop} = 1234;
delete $lop{yop};
say "$lop{yop}";
