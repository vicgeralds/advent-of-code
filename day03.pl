#!/usr/bin/perl

my $sum = 0;

my $input = "";
while (<>) {
    s/\n$//;
    $input .= $_;
#    while (/mul[(](\d{1,3}),(\d{1,3})[)]/g) {
#        $sum += $1 * $2;
#    }
}

$input =~ s/don't[(][)].*?do[(][)]//g;
$input =~ s/don't[(][)].*//;

while ($input =~ /mul[(](\d{1,3}),(\d{1,3})[)]/g) {
    $sum += $1 * $2;
}

print $sum, "\n";
