#! /usr/bin/perl

use v5.10;

#say '[1]';
#
#chdir '/' or warn "not dir error";
#exec 'ls', '-la' or warn "not execute";

#say '[2]';
#
#open STDOUT, '>', 'ls.out' or die "not write: $!";
#open STDERR, '>', 'ls.err' or die "not write: $!";
#chdir '/' or warn "not dir error";
#exec 'ls', '-la' or warn "not execute";

say '[3]';

if ('date' =~ /\AS/) {
  say "PLAY";
}
else {
  say "WORK";
}

say '[4]';

sub my_hup_handler {state $n; say 'Caight HUP: ', ++$n}
sub my_usr1_handler {state $n; say 'Caight USR1: ', ++$n}
sub my_usr2_handler {state $n; say 'Caight USR2: ', ++$n}
sub my_int_handler {say 'Caight INT. Exitinf.'; exit}

say "I am $$";

foreach (qw/int hup usr1 usr2/) {
  $SIG{ uc $_} = "my_${$_}_handler";
}
  
