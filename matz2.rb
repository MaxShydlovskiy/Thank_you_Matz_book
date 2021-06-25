#!/usr/bin/ruby 
a = [3, 2, 1]      # This is an array literal
a[3] = a[2] - 1    # Use square brackets to query and set array elements
a.each do |elt|    # each is an iterator. The block has parameter elt
print elt+1        # Prints "4321"
end                # This block was delimited with do/end instead of {}

a = [1,2,3,4]                # Start with an array
b = a.map {|x| x*x }         # Square elements: b is [1,4,9,16]
c = a.select {|x| x%2==0 }   # Select even elements: c is [2,4]
a.inject do |sum,x|          # Compute the sum of the elements => 10
  sum + x
end
