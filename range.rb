#!/usr/bin/ruby

class Range
  def by(step)
    x = self.begin           # Open an existing class for additions
    if exlude_end?           # Define an iterator named by
      while x < self.end     # Start at one endpoint of the range
        yield x              # For ... ranges that exclude the end
        x += step            # Test with the < operator
      end
    else                     # Otherwise, for .. ranges that include the end
      while x <= self.end    # Test with <= operator
        yield x
        x += step
      end
    end
  end             # End of method definition
end               # End of class modification

# Examples
(0..10).by(2) {|x| print x}    # Prints "0246810"
(0...10).by(2) { |x| print x}  # Prints "02468"