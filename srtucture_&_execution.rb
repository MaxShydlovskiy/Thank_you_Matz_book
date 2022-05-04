total = x +     # Incomplete expression, parsing continues
  y

total = x  # This is a complete expression
  + y      # A useless but complete expression

var total = first_long_variable_name + second_long_variable_name \
  + third_long_variable_name # Note no statement terminator above

animals = Array.new
  .push("dog")   # Does not work in Ruby 1.8
  .push("cow")
  .push("cat")
  .sort

# Syntatic Structure

[1,2,3]                # An Array literal
{1=>"one", 2=>"two"}   # A Hash literal
1..3                   # A Range literal

1         # A primary expression
x         # Another primary expression
x = 1     # An assignment expression
x = x + 1 # An expression with two operators

if x < 10 then   # If this expression is true
  x = x + 1      # Then execute this statement
end              # Marks the end of the conditional
while x < 10 do  # While this expression is true...
  print x        # Execute this statement
  x = x + 1      # Then execute this statement
end              # Marks the end of the loop

# Block Structure in Ruby

3.times { print "Ruby! " }

1.upto(10) do |x|
  print x
end

module Stats                          # A module
  class Dataset                       # A class in the module
    def initialize(filename)          # A method in the class
      IO.foreach(filename) do |line|  # A block in the method
        if line[0,1] == "#"           # An if statement in the block
          next                        # A simple statement in the if
        end                           # End the if body
      end                             # End the block
    end                               # End the method body
  end                                 # End the class body
end                                   # End the module body

# File Structure

#!/usr/bin/ruby -w          shebang comment
# -*- coding: utf-8 -*-     coding comment
# require 'socket'           # load networking library
#  ...                      # program code goes here
#__END__                    # mark end of code
#  ...                      # program data goes here

# ruby -E utf-8            # Encoding name follows -E
# ruby -Eutf-8             # The space is optional
# ruby --encoding utf-8    # Encoding following --encoding with a space
# ruby --encoding=utf-8    # Or use an equals sign with --encoding
