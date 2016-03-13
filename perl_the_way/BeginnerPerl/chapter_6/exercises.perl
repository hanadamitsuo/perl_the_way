#! /usr/bin/perl

use v5.10;

say '[1]';

%name = (fred=>flimtstone,barney=>rubble,wilma=>ken); 
chomp($str = <STDIN>);
say "$name{$str}";

say '[2]';

chomp(@array = <STDIN>);

%name_hash;
foreach (@array) {
  $name_hash{$_} +=1;
}
foreach (keys %name_hash) {
  say "キーワード$_ 、数$name_hash{$_}";
}

say '[3]';

while (($key,$value) = sort each %ENV){
  printf "%2s","$key => $value\n";
}
