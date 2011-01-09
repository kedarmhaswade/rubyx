#!/usr/bin/env ruby
=begin
Implements an entity whose discrete Ranges make sense. Thus, it defines
a method {#succ} because it is possible to find out the successor of an instance
of this class.
@see Range
=end
class Discrete
  include Comparable #mix in methods from Comparable for free!
  attr_reader :n
  # Creates an instance of this element, based on the given number.
  # @param [Integer] n associated number
  def initialize(n)
    @n = n
  end

  # Returns the successor of this element. If you comment out this method, the Range#include?
  # method will fail. This is because since a {Range} of instances of this class is <i>not</i>
  # a range of Numeric instances, Ruby 1.9 calls this method on first element of the range,
  # compares the returned value with given value. If this method is commented out, when you call
  # {Range#include?}, you will get "in `each': can't iterate from Discrete (TypeError)"
  # @return [Discrete] an instance of {Discrete} that is this instance's successor
  # @see #<=>
  def succ
    Discrete.new(n + 1)
  end

  # Overrides Object#<=>, the well known spaceship operator.
  # @note
  # This method is a <i>must</i> for caller to be able to create {Range} instances
  # out of instances of this class. If you comment out this method, you get
  # <b> bad value for range (ArgumentError) </b> error when you try to create
  # an instance of this {Range} with instances of this class.

  # @param [Discrete] other instance of this class to compare with
  # @return [Integer] -1 if this comes before other, 0 if this is same as other and 1 if this
  # comes after other, in this class's natural order
  # @see #succ
  def <=>(other)
    debug("<=> called for #{n}")
    n.<=> other.n
  end

  # Ruby's <i> equality</i> operator. This is essential for the methods like
  # {Range#include?} to work. If you comment out this method,
  # you will get incorrect answer for the include? method. Interestingly, but
  # not surprisingly, {Range#cover?} continues to work as expected even if you
  # comment out this method because that method only depends on the spaceship
  # operator.
  # @param [Discrete] other instance of this class to compare with
  # @return true if this is <i> same </i> as other, false otherwise
  # @see #<=>
  def ==(other)
    n == other.n
  end

  private

  def debug(s)
    puts "debug: #{s}" if $DEBUG
  end
end

f = Discrete.new(10)
l = Discrete.new(20)
n = Discrete.new(11)
r = Range.new(f, l)
puts r.cover?(n)
puts r.include?(n)
puts n.between?(f, l)
