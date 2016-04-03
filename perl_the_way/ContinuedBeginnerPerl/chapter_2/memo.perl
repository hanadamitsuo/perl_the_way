#! /usr/bin/perl

use v5.10;

print 'Two castaways are', 'Gilligan', 'and', 'Skipper', '\n';

@list = sort qw(Gilligan Skipper Ginger Professor Mary-Ann);
say @list;

@re_list = reverse qw(Gilligan Skipper Ginger Professor Mary-Ann);
say @re_list;

@num = (1,2,4,8,16,32,64);
@grep_list = grep $_ > 10, @num;
say @grep_list;

@ma_grep_list = grep /4$/, @num;
say @ma_grep_list;

@digit_num = (1,2,4,8,16,32,64);
@odd_sum = grep digit_sum_is_odd($_), @digit_num;

sub digit_sum_is_odd {
  $input = shift;
  @digits = split //, $input;

  $sum =0;
  $sum += $_ for @digits;
  return $sum % 2;
}
say  @odd_sum;

@input_list = qw(Gilligan Skipper Ginger Professor Mary-Ann);
@results = grep {
  block;
  of;
  code;
} @input_list;
say @results;

$results = grep {
  block;
  of;
  code;
} @input_list;
say $results;

@results = grep {
  $input = $_;
  @digits = split //, $input;

  $sum =0;
  $sum += $_ for @digits;
  $sum % 2;
} @digit_num;
say @results;

@results = grep {
  $sum =0;
  $sum += $_ for split //;
  $sum % 2;
} @digit_num;
say @results;

@results = map $_ + 100, @digit_num;
say @results;

@results = map {$_, 3 * $_} @digit_num;
say @results;

%hash = @results;
say %hash;

%hash = map {$_, 3 * $_} @digit_num;
say %hash;

@result = map {split //, $_} @digit_num;
say @result;

@result = map {
  @digits = split //, $_;
  if($digits[-1] ==4) {
    @digits;
  } else {
    ();
  }
} @digit_num;
say @result;

eval {$average = $total / $count};
say "error : $@" if $@;

eval { &result };
say "error : $@" if $@;

eval '$sum = 2+ 2';
say "is $sum";

foreach (qw(+ - * /)) {
  $result = eval "2 $_ 2";
  say "2 $_ 2 is $result";
}

print 'The quotient is ', eval '5 /', "\n";
warn $@ if $@;
