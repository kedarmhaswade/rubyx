#!/usr/bin/env ruby
=begin
   Implements an entity whose discrete Ranges make sense. Thus, it defines
   a method {#succ} because it is possible to find out the successor of an instance
   of this class.
   @see {Range}
=end
class Discrete
  attr_reader :n, :log

=begin
  Creates an instance of this element, based on the given number.
  @param [Integer] n associated number
=end
  def initialize(n)
    @n = n
  end

=begin
  Returns the successor of this element.
=end

=begin
  Overrides Object#<=>, the well known spaceship operator.
=end
  def <=>(other)
    debug("<=> called for #{n}")
    n.<=> other.n
  end

  def eql?(other)
    debug("eql? called for #{n}")
    n.eql? other.n
  end

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