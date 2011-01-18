#!/usr/bin/env ruby

def randomized(n)
  a = (0..n-1).to_a
  n.times do |index|
    other = rand n
    a[index], a[other] = a[other], a[index]
  end
  a
end
# finds the index of target in a, returns nil if target does not exist in a
def find_index(a, target) # this is where returning directly from withing block is ok!
  a.each_with_index do |e, index|
    return index if e == target # returns to caller on line 19. This is exactly what we want
  end
    return nil  # omitting return here is OK and doing so is more idiomatic
end
n = 5
index_of_n = find_index(randomized(10), n)
if index_of_n
  puts "#{n} is in this array at index: #{index_of_n}"
else
  puts "#{n} does not exist in array"
end
