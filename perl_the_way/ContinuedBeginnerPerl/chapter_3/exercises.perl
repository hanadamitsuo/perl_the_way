#! /usr/bin/perl

use v5.10;
use Cwd;
use File::Spec;

say '[1]';

$cwd = getcwd;
say $cwd;

@file = glob(".* *");
print map {"    ".File::Spec->catfile($cwd,$_)."\n"} @file;

say '[2]';

use Business::ISBN;

$isbn = Business::ISBN->new($ARGV[0]);

say "ISBNコード : ".$isbn->as_string;
say "国別コート : ".$isbn->country_code;
say "出版社コート : ".$isbn->publisher_code;
