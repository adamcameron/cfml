my @numbers = qw/tahi rua toru wha rima ono whitu waru iwa tekau/;
my @oddNumbers = @numbers[map 2*$_, 0.. @numbers/2 ];
print join("\n", @oddNumbers );