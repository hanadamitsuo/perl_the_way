#! /usr/bin/perl

use v5.10;

say '[1]';

#my @list = <>;
#print reverse @list;

say '[2]';

my $num = qw/1234567890/;
say "$num" x 5;

my @wr = <STDIN>;
chomp(@wr);
my $str = ("%20s\n" x @wr);
printf $str,@wr;

say '[3]';

my $num2 = qw/1234567890/;
say "$num2" x 5;

say "カラムを入力してね";
chomp(my $karam = <STDIN>);
say "つぎはもじだよ";
chomp(my @wr2 = <STDIN>);
my $str2 = ("%${karam}s\n" x @wr2);
say $str2;
printf $str2,@wr2;
