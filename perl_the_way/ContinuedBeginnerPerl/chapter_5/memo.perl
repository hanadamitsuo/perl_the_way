#! /usr/bin/perl

use v5.10;

@ski = qw/bule_shirt hat jacket preserver sunscreen/;
$re_ski = \@ski;
$re_two_ski = $re_ski;

$re_two_ski = undef;
say @ski;
say $re_ski;
say $re_two_ski;

my $ref;

{
  @skiw = qw/bule_shirt hat jacket preserver sunscreen/;
  $ref = \@skiw;

  say "$ref->[2]";
}

say "$ref->[2]";

push @$ref, 'sextant';
say $ref->[-1];

$copy = $ref;
say $copy;

$copy2 = \@$ref;
say $copy;

@ski = qw/bule_shirt hat jacket preserver sunscreen/;
@ski_name = ('The ski', \@ski);

@gill = qw/red_shirt hat lucky_socks water_bottle/;
@gill_name = ('The gill', \@gill);

@prof = qw/unscreen water_bottle side_rule batteries radio/;
@prof_name = ('The prof', \@prof);

@all_whith_name = (
  \@ski_name,
  \@gill_name,
  \@prof_name,
);
say @all_whith_name;

my @all_whith_name;
sub init {
  @ski = qw/bule_shirt hat jacket preserver sunscreen/;
  @ski_name = ('The ski', \@ski);
  
  @gill = qw/red_shirt hat lucky_socks water_bottle/;
  @gill_name = ('The gill', \@gill);
  
  @prof = qw/unscreen water_bottle side_rule batteries radio/;
  @prof_name = ('The prof', \@prof);
  
  @all_whith_name = (
    \@ski_name,
    \@gill_name,
    \@prof_name,
  );
}
init();
say @all_whith_name;
@all_whith_name = undef;
say @all_whith_name;

sub get_init {
  @ski = qw/bule_shirt hat jacket preserver sunscreen/;
  @ski_name = ('The ski', \@ski);
  
  @gill = qw/red_shirt hat lucky_socks water_bottle/;
  @gill_name = ('The gill', \@gill);
  
  @prof = qw/unscreen water_bottle side_rule batteries radio/;
  @prof_name = ('The prof', \@prof);
  
  return (
    \@ski_name,
    \@gill_name,
    \@prof_name,
  );
}

@all_with = get_init();
say @all_with;

$gill = $all_with[2][1];
say $gill;

@all_with = undef;
say $gill;
