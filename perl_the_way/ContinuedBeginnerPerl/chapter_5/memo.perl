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

@data1 =qw(one won);
@data2 =qw(two too to);

push @data2, \@data1;
push @data1, \@data2;

say @data2;
say @data1;

{
  @data1 =qw(one won);
  @data2 =qw(two too to);
  push @data2, \@data1;
  push @data1, \@data2;
 
  @data1 = (); 
  @data2 = ();
}
say "@data2";
say "@data1";

@ski_with_name;
{
  @ski = qw/bule_shirt hat jacket preserver sunscreen/;
  @ski_name = ('The ski', \@ski);
}

$ref_ski =
  [ qw/bule_shirt hat jacket preserver sunscreen/ ];

my $red_to_ski;
{
  @temp_name =
    (qw/bule_shirt hat jacket preserver sunscreen/);
    $red_to_ski = \@temp_name;
}
say "$red_to_ski";

$fuits;
{
  @secret_variable = ('pineapple', 'papaya', 'mango');
  $fuits = \@secret_variable;
}
say "$fuits";

sub get_provisions_list {
  return (
  [ 'The Skipper', [qw(bule_shirt hat jacket preserver sunscreen)]],
  [ 'The Professor', [qw(unscreen water_bottle side_rule batteries radio)]],
  [ 'The Gilligan', [qw(red_shirt hat lucky_socks water_bottle)]],
  );
}

@all_with_name = get_provisions_list();
say @all_with_name;

%gilligan_info = (
  name  => 'Gilligan',
  hat   => 'White',
  shirt => 'Red',
  position => 'First Mate',
);

%skipper_info = (
  name => 'Skipper',
  hat  => 'Black',
  shirt => 'Blue',
  position => 'Captain',
);

@crew = (\%gilligan_info, \%skipper_info);
say @crew;

$ref_to_gill_info;
{
  %gilligan_info = (
    name  => 'Gilligan',
    hat   => 'White',
    shirt => 'Red',
    position => 'First Mate',
  );
  $ref_to_gill_info = \%gilligan_info;
}
say $ref_to_gill_info;

$ref_to_gill_info2 = {
  name  => 'Gilligan',
  hat   => 'White',
  shirt => 'Red',
  position => 'First Mate',
};

@crew = (
  {
    name  => 'Gilligan',
    hat   => 'White',
    shirt => 'Red',
    position => 'First Mate',
  },

  {
    name => 'Skipper',
    hat  => 'Black',
    shirt => 'Blue',
    position => 'Captain',
  },
);
say @crew;
