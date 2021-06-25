#!/usr/bin/ruby

1.class       # => Fixnum: the number 1 is a Fixnum

0.0.class     # => Float: floating-point numbers have class Float

true.class    # => TrueClass: true is a the singleton instance of TrueClass

false.class   # => FalseClass

nil.class     # => NilClass

3.times { print "Ruby! " }   # Prints "Ruby! Ruby! Ruby! "

1.upto(9) {|x| print x }     # Prints "123456789"

