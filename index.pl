print "Welcome to the Perl Demo!\n";

my $name = "Perl";
my $version = 5.36;
my $is_fun = 1;

print "Language: $name, Version: $version, Fun: " . ($is_fun ? "Yes" : "No") . "\n";

my @numbers = (1, 2, 3, 4, 5);
print "Numbers: @numbers\n";

my %ages = ("Alice" => 30, "Bob" => 25);
foreach my $person (keys %ages) {
    print "$person is $ages{$person} years old\n";
}

sub greet {
    my ($person) = @_;
    print "Hello, $person!\n";
}
greet("Alice");

for my $i (1..5) {
    print "Loop $i\n";
}