#!perl

print "# 1\n";
my $Circumference = 12.5 * 3.1415;
print "$Circumference \n";

print "# 2\n";
my $line = <STDIN>;
$Circumference = $line * 3.1415;
print "$Circumference \n";

print "# 3\n";
my $line = <STDIN>;
if ($line < 0) {
  print "0\n";
}
else {
  $Circumference = $line * 3.1415;
  print "$Circumference \n";
}

print "# 4\n";
my $line = <STDIN>;
my $line2 = <STDIN>;
$Circumference = $line * $line2;
print "$Circumference \n";

print "# 5\n";
my $line = <STDIN>;
my $line2 = <STDIN>;
$Circumference = $line x $line2;
print "$Circumference \n";
