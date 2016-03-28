#! /usr/bin/perl

use v5.10;

system 'date';

system 'ls -l $HOME';

#system 'long_running_command with parameters &';

unless (system 'date'){
  say "OK";
}

$ENV{'PATH'} = "/home/rootbeer/bin:$ENV{'PATH'}";
delete $ENV{'IFS'};
$make_result = system 'make';

chdir '/tmp' or die "Cannot chdir /tmp: $!";
exec 'bedrock', '-o', 'args1', @ARGV;

$ENV{PATH} = '/bin:/usr/bin';
$ENV{DEBUG} = 1;
$ENV{ROCK} = 'granite';

chdir '/Users/fred';
open STDOUT, '>', '/tmp/granite.out';

exec 'bedrock';

$now = 'date';
say "$now";

chomp($now = 'date');
say "$now";

@list = qw/ int rand sleep length hex eof not exit sqrt umask/;
%about;

foreach (@list) {
  $about{$_} = qx(perldoc -t -f $_);
}
say %about;

$output = qx'echo $$';
say $output;

$output = 'frobnitz -enable 2>&1';
say $output;

$result = 'some_questionable_command arg  arg argh </dev/null';
say $result;

$who = 'who';
@who_list = split /\n/, $who;
say @who_list;

foreach ('who') {
  ($user, $tty, %date) = /(\S+)\s+(\S)\s+(.*)/;
  $ttys{$user} .= "$tty at $date\n";
}
say "$ttys{$user}";

use IPC::System::Simple qw(system);

$tarfile = 'something*wichked.tar';
#@dirs = qw(fred|flintstone <barney&rubble> betty);
@dirs = "/tmp";
system 'tar', 'cvf', $tarfile, @dirs;

open DATE, 'date|' or die "cannot date: $!";

open $date_fh, '-|', 'date' or die "cannot date: $!";
$now = <$date_fh>;
say $now;
close $dath_fh;
die "mail: non-zero exit of $?" if $?;

open $flind_fh, '-|', 'find', qw(/ -atime +90 -size +1000 -print) or die "fork: $!";
while (<$find_fh>) {
  chomp;
  printf "%s size %dK last accessed %.2f days ago\n", $_, (1023 + -s $_)/1024, -A $_;
}

defined($pid = fork) or die "Cannot fork: $!";
unless ($pid) {
  exec 'date';
  die "cannot exec date: $!";
}
waitpid($pid,0);

unless (kill 0, $pid) {
  warn "$pid has gone away";
}

$tmp = "/tmp/myprog.$$";
mkdir $tmp, 0700 or die "cannot $tmp";

sub clean_up {
  unlink glob "$tmp/*";
  rmdir $tmp;
}

sub handler {
  &clean_up();
  die "inteerruptes";
}

$SIG{'INT'} = 'handler';
&clean_up;

