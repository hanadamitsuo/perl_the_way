#! /usr/bin/perl

use v5.10;
use File::Basename;
use File::Spec;
use CGI qw(:all);
use Time::Piece;
use DateTime;

$name = "/usr/local/bin/perl";
$basename = basename $name;
say "$basename";

$dirname = File::Basename::dirname $name;
say "$dirname";

$new_name = File::Spec->catfile($dirname, $basename);
say $new_name;

say header("text/plain");
foreach $param ( param() ) {
  say "$param: " . param($param);
}

$dt = DateTime->from_epoch( epoch => time );
say $dt;

$dt1 = DateTime->new(
  year  => 1900,
  month => 10,
  day   => 18,
);
say $dt1;

$t = localtime;
say $t->month;
