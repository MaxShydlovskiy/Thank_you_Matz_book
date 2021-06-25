#!/usr/bin/ruby

#This class represents a sequence of numbers characterized by the three
# parameters from, to, and by. The numbers x in the sequence obey the
# following two constraints:
#
#  from <= x <= to
#  x = from + n*by, where n is an integer

class Sequence      # This is an enumerable class; it defines an each iterator below.

  include Enumerable  # Include the methods of this module in this class

# The initialize method is special; it is automatically invoked to
# initialize newly created instances of the class
  def initialize(from, to, by)
    # Just save our parameters into instance variables for later use
    @from, @to @by=from, to, by   # Note parallel assigment and @ prefix
  end 

# This is the iterator required by the Enumerable module
  def each
    x = @from           # Start at the starting point
    while x <= @to      # While we haven't reached the end
      yield x           # Pass x to the block assiciated with the iterator
      x += @by          # Increment x
    end
  end

# Define the length method (following arrays) to return the number of
# values in the sequence
  def length
    return 0 if @from > @to       # Note if used as statement modifier
    Integer((@to-@from)/@by) + 1  # Compute and return length of sequence
  end

# Define another name for the same method.
# It is common for methods to have multiply name in Ruby
  alias size length   # size is now a synonym of length

# Override the array-acces operator to give random acces to the sequence
  def [](index)
    return nil if index < 0    # Return nil for negative indexes
    v = @from + index*@by      # Compute the value
    if v <= @to                # If it is a part of the sequence
      v
    else
      nil
    end
  end

# Override arithmetic operators to return new Sequence objects
  def*(factor)
    Sequence.new(@from*factor, @to*factor, @by*factor)
  end

  def +(ffset)
    Sequence.new(@from+offset, @to+offset, @by)
  end
end

=begin
Example of code,that use Sequence class

s = Sequence(1, 10, 2)        => From 1 to 10 by 2's
s.each {|x| print x }         => Print "13579"
print s[s.size-1]             => Print 9
t = (s+1)*2                   => From 4 to 22 by 4's
end
