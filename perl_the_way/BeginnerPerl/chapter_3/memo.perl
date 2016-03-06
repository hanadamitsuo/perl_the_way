#! /use/bin/perl

my $num = 2.566;
my @fred;
$fred[1] = "ok";
$fred[$num - 1];
print "@fred";

my @mel;
$mel[100];
#print "@mel";

print "$mel[$#rokcs]";

my $list = qw {aaa,bbb,ccc};
print "$list";

my @one;
$one[0] = 1;
$one[1] = 2;

$one[1] = $one[0];
print "$one[1]";

my @stato = (1, unidef, 3);
print "@stato";


my @pop_list = (5..9);
my $last = pop(@pop_list);
print "$last";
pop @pop_list;
print "@pop_list";

my @hone = qw /zero,one,two,three,four/;
print "$hone[0]\n";
my @jon;
push @jon, @hone;
print "@jon\n";
print "$jon[1]\n";

my @array = qw# hh #;
shift(@array);
print "@array\n";

my @array_sp = (1,2,3,4,5,6);
my @list_sp = splice @array_sp, 1, 2 ,aa;
print @list_sp;
print @array_sp;

my @hoge = qw(hello,dolly);
my $hoge = sos;
my $y = 2;
my $x = "this is ${hoge}[1]s place";
print "$x\n";

$_ = "hahahaha\n";
print;

my @ll = (zz,xx,cc,vv,b);
my @kk = reverse(@ll);
print "$ll[0]\n";
print "$kk[0]\n";

my @fuga = (1..6,7,9,8);
my @log = reverse sort @fuga;
print "@log\n";

my @number = sort (97..102);
print "@number\n";
