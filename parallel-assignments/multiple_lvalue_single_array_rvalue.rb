#!/usr/bin/env ruby
# This is suggested by Josh Cheek on Ruby forum
# This example shows the parallel assignment that is really useful in cases
# where you want to separate arguments from an array into individual variables
# and several library methods do return arrays
$stdin = DATA
while input = gets
  name , num = input.split
  puts "#{name.capitalize}'s favourite number is #{num}"
end
__END__
josh 12
bill 42
sally 13
ned 99
clara 1000000
