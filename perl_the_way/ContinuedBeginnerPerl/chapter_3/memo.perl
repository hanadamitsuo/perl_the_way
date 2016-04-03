#! /usr/bin/perl

use v5.10;

use File::Basename;

$some_full_path = '/var/www/Moomin/lib/Moomin/Web/hoge';
$basename = basename($some_full_path);
say "$basename";

$dirname = dirname($some_full_path);
say "$dirname";

use File::Basename qw(fileparse basename);

$basename = File::Basename::basename($some_full_path);
say "$basename";

use File::Basename();
$basename = File::Basename::basename($some_full_path);

use File::Spec;

$file = File::Spec->catfile($homedir{gilligan},'web_docs', 'photos', 'USS_Minnow.gif');
say $file;

use Math::BigInt;

$value = Math::BigInt->new(2);
$value->bpow(1000);
say $value->bstr();

