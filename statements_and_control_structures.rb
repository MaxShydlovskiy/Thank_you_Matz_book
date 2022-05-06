x = ARGV[0].to_f    # Convert first argument to a number
y = ARGV[1].to_f    # Convert second argument to a number
sum = x + y         # Add the arguments
puts sum            # Print the sum

# Simplest form of if
if expression
  code
end

# If x is less than 10, increment it
if x < 10                    # newline separator
  x += 1
end
if x < 10 then x += 1 end    # then separator

if x < 10 then
  x += 1
end

if expression
  code
else
  code
end

if data
  data << x
else
  data = [x]
end

if expression1
  code1
elsif expression2
  code2
#  .
#  .
#  .
elsif expressionN
  codeN
else
  code
end

if x == 1
  name = "one"
elsif x == 2
  name = "two"
elsif x == 3 then name = "three"
elsif x == 4; name = "four"
else
  name = "many"
end

name = if      x == 1 then "one"
       elsif   x == 2 then "two"
       elsif   x == 3 then "three"
       elsif   x == 4 then "four"
       else                "many"
       end

if expression then code end
# Simply:
code if expression

puts message if message    # Output message, if it is defined


# puts message Unconditional
# if message   Incomplete!

y = x.invert if x.respond_to? :invert
y = (x.invert if x.respond_to? :invert)

if expression
  line1
  line2
end

begin
  line1
  line2
end if expression

(
  line1
  line2
) # end if expression

# Output message if message exists and the output method is defined
puts message if message if defined? puts

# Repeating an if modifier like this is hard to read, however, and it makes more sense to
# combine the two conditions into a single expression:
puts message if message and defined? puts

# single-way unless statement
unless condition
  code
end
# two-way unless statement
unless condition
  code
else
  code
end
# unless modifier
code unless condition

# Call the to_s method on object o, unless o is nil
s = unless o.nil?                       # newline separator
  o.to_s
end
s = unless o.nil? then o.to_s end       # then separator

# For single-line conditionals like this, the modifier form of unless is usually clearer:
s = o.to_s unless o.nil?

unless x == 0
  puts "x is not 0"
else
  unless y == 0
    puts "y is not 0"
  else
    unless z == 0
      puts "z is not 0"
    else
      puts "all are 0"
    end
  end
end

name = case
       when   x == 1 then "one"
       when   x == 2 then "two"
       when   x == 3 then "three"
       when   x == 4 then "four"
       else "many"
       end

case
when x == 1
  "one"
when x == 2
  "two"
when x == 3
  "three"
end

case
when x == 1, y == 0 then "x is one or y is zero"       # Obscure syntax
when x == 2 || y == 1 then "x is two or y is one"      # Easier to understand
end

name = case x
       when 1                   # Just the value to compare to x
         "one"
       when 2 then "two"        # Then keyword instead of newline
       when 3; "three"          # Semicolon instead newline
       else "many"              # Optional else clause at end
       end
s

name = case
       when   x === 1 then "one"
       when   x === 2 then "two"
       when   x === 3 then "three"
       when   x === 4 then "four"
       else "many"
       end

# Take different actions depending on the class of x
puts case x
     when String then "string"
     when Numeric then "number"
     when TrueClass, FalseClass then "boolean"
     else "other"
     end

tax = case income
      when 0..7550
        income * 0.1
      when 7550..30650
        755 + (income-7550)*0.15
      when 30650..74200
        4220 + (income-30655)*0.25
      when 74200..154800
        15107.5 + (income-74201)*0.28
      when 154800..336550
        37675.5 + (income-154800)*0.33
      else
        97653 + (income-336550)*0.35
      end

s
while line=gets.chomp do  # Loop, asking the user for input each time
  case line
  when /^\s*#/            # If input looks like a comment...
      next                # skip to the next line.
  when /^quit$/i          # If input is "quit" (case insensitive)...
    break                 # exit the loop.
  else                    # Otherwise...
    puts line.reverse     # reverse the user's input and print it.
  end
end

def hasValue?(x)          # Define a method named hasValue?
  case x                  # Multiway conditional based on value of x
  when nil, [], "", 0     # if nil===x || []===x || ""===x || 0===x then
    false                 # method return value is false
  else                    # Otherwise
    true                  # method return value is true
  end
end


def how_many_messages(n) # Handle singular/plural
  "You have " + n.to_s + (n==1 ? " message." : " messages.")
end

x = 10
while x >= 0 do
  puts x
  x = x - 1
end

# Count back up to 10 using an until loop
x = 0
until x > 10 do
  puts x
  x = x + 1
end

x = 0
puts x = x + 1 while x < 10

x = 0
while x < 10 do puts x = x + 1 end

a = [1,2,3]                 # Initialize an array
puts a.pop until a.empty?   # Pop elements from array until empty

x = 10
begin
  puts x
  x = x - 1
end until x == 0

x = 0
(
  puts x
  x = x - 1
) until x == 0

# for var in collection do
#   body
# end

# Print the elements in an array
array = [1,2,3,4,5]
for element in array
  puts element
end

# Print the keys and values in a hash
hash = {:a=>1, :b=>2, :c=>3}
for key,value in hash
  puts "#{key} => #{value}"
end

# For example, the for loop shown above for enumerating the
# keys and values of a hash could also be written with an explicit use of the each iterator:
hash = {:a=>1, :b=>2, :c=>3}
hash.each do |key,value|
  puts "#{key} => #{value}"
end

3.times { puts "thank you!" }     # Express gratitude three times
data.each {|x| puts x }           # Print each element x of data
[1,2,3].map {|x| x*x }            # Compute squares of array elements
factorial = 1                     # Compute the factorial of n
2.upto(n) {|x| factorial *= x }

4.upto(6) {|x| print x}     # => prints "456"
3.times {|x| print x }      # => prints "012"
0.step(Math::PI, 0.1) {|x| puts Math.sin(x) }

[1,2,3].each {|x| print x }   # => prints "123"
(1..3).each {|x| print x }    # => prints "123" Same as 1.upto(3)

File.open(filename) do |f|      # Open named file, pass as f
  f.each {|line| print line }   # Print each line in f
end                             # End block and close file

File.open(filename) do |f|
  f.each_with_index do |line,number|
    print "#{number}: #{line}"
  end
end

squares = [1,2,3].collect {|x| x*x}     # => [1,4,9]
evens = (1..10).select {|x| x%2 == 0}   # => [2,4,6,8,10]
odds = (1..10).reject {|x| x%2 == 0}    # => [1,3,5,7,9]

data = [2, 5, 3, 4]
sum = data.inject {|sum, x| sum + x }         # => 14 (2+5+3+4)
floatprod = data.inject(1.0) {|p,x| p*x }     # => 120.0 (1.0*2*5*3*4)
max = data.inject {|m,x| m>x ? m : x }        # => (largest element)

# This method expects a block. It generates n values of the form
# m*i + c, for i from 0..n-1, and yields them, one at a time,
# to the associated block.
def sequence(n, m, c)
  i = 0
  while(i < n)          # Loop n times
    yield m*i + c       # Invoke the block, and pass a value to it
    i += 1              # Increment i each time
  end
end

# Here is an invocation of that method, with a block.
# It prints the values 1, 6, and 11
sequence(3, 5, 1) {|y| puts y }

# Generate n points evenly spaced around the circumference of a
# circle of radius r centered at (0,0). Yield the x and y coordinates
# of each point to the associated block.
def circle(r,n)
  n.times do |i|
  # Notice that this method is implemented with a block
    angle = Math::PI * 2 * i / n
    yield r*Math.cos(angle), r*Math.sin(angle)
  end
end

# This invocation of the iterator prints:
# (1.00, 0.00) (0.00, 1.00) (-1.00, 0.00) (-0.00, -1.00)
circle(1,4) {|x,y| printf "(%.2f, %.2f) ", x, y }

# Return an array with n elements
# If a block is given, also yield
def sequence(n, m, c)
  i, s = 0, []                # Initialize variables
  while(i < n)                # Loop n times
    y = m*i + c               # Compute value
    yield y if block_given?   # Yield, if block
    s << y                    # Store the value
    i += 1
  end
  s                           #Return the array of values
end

# Call this method with an Enumerator instead of a mutable array.
# This is a useful defensive strategy to avoid bugs.
process(data.to_enum) # Instead of just process(data)

s = "hello"
s.enum_for(:each_char).map {|c| c.succ }    # => ["i", "f", "m", "m", "p"]

enumerator = 3.times                    # An enumerator object
enumerator.each {|x| print x }          # Prints "012"

# downto returns an enumerator with a select method
10.downto(1).select {|x| x%2==0}        # => [10,8,6,4,2]
# each_byte iterator returns an enumerator with a to_a method

"hello".each_byte.to_a
# => [104, 101, 108, 108, 111]

def twice
  if block_given?
    yield
    yield
  else
    self.to_enum(:twice)
  end
end

enumerator = s.each_char.with_index

for line, number in text.each_line.with_index
  print "#{number+1}: #{line}"
end

iterator = 9.downto(1)
begin
  print iterator.next while true
rescue StopIteration
  puts "...blastoff!"
end                       # 987654321...blastoff! 
                          # => nil

iterator = 9.downto(1)
loop do
  print iterator.next
end
puts "...blastoff!"       # 987654321...blastoff! 
                          # => nil

module Iterable
  include Enumerable

  def each
    loop { yield self.next }
  end
end

def iterate(iterator)
  loop { yield iterator.next }
end

iterate(9.downto(1)) {|x| print x }       # 987654321 => 9

# Call the each method of each collection in turn.
# This is not a parallel iteration and does not require enumerators.
def sequence(*enumerables, &block)
  enumerables.each do |enumerable|
    enumerable.each(&block)
  end
end

  # Iterate the specified collections, interleaving their elements.
  # This can't be done efficiently without external iterators.
  # Note the use of the uncommon else clause in begin/rescue.
def interleave(*enumerables)
  # Convert enumerable collections to an array of enumerators.
  enumerators = enumerables.map {|e| e.to_enum }
  # Loop until we don't have any more enumerators.
  until enumerators.empty?
    begin
      e = enumerators.shift       # Take the first enumerator
      yield e.next                # Get its next and pass to the block
    rescue StopIteration          # If no more elements, do nothing
    else                            # If no exception occurred
    enumerators << e              # Put the enumerator back
    end
  end
end
  # Iterate the specified collections, yielding tuples of values,
  # one value from each of the collections. See also Enumerable.zip.
def bundle(*enumerables)
  enumerators = enumerables.map {|e| e.to_enum }
  loop { yield enumerators.map {|e| e.next} }
end

# Examples of how these iterator methods work
a,b,c = [1,2,3], 4..6, 'a'..'e'
sequence(a,b,c) {|x| print x}       # prints "123456abcde"
interleave(a,b,c) {|x| print x}     # prints "14a25b36cde"
bundle(a,b,c) {|x| print x}         # '[1, 4, "a"][2, 5, "b"][3, 6, "c"]'

=begin

3.1.1 :072 > a,b,c = [1,2,3], 4..6, 'a'..'e'
 => [[1, 2, 3], 4..6, "a".."e"] 
3.1.1 :073 > sequence(a,b,c) {|x| print x}
123456abcde => [[1, 2, 3], 4..6, "a".."e"] 
3.1.1 :074 > interleave(a,b,c) {|x| print x}
14a25b36cde => nil 
3.1.1 :075 > bundle(a,b,c) {|x| print x}
[1, 4, "a"][2, 5, "b"][3, 6, "c"] => [1, 2, 3]

=end

a = [1,2,3,4,5]
a.each {|x| puts "#{x},#{a.shift}" }
# 1,1
# 3,2
# 5,3
#  => [4, 5]

module Enumerable
  def each_in_snapshot &block
    snapshot = self.dup     # Make a private copy of the Enumerable object
    snapshot.each &block    # And iterate on the copy
  end
end

# Print the numbers 1 to 10
1.upto(10) {|x| puts x }      # Invocation and block on one line with braces
1.upto(10) do |x|             # Block delimited with do/end
  puts x
end
1.upto(10)                    # No block specified
#  {|x| puts x }     Syntax error: block not after an invocation

1.upto(3) {|x| puts x }       # Parens and curly braces work
1.upto 3 do |x| puts x end    # No parens, block delimited with do/end
# 1.upto 3 {|x| puts x }        Syntax Error: trying to pass a block to 3!

# The Hash.each iterator passes two arguments to its block
hash.each do |key, value|       # For each (key,value) pair in the hash
  puts "#{key}: #{value}"       # Print the key and the value
end                             # End of the block

# The block takes two words and "returns" their relative order
words.sort! {|x,y| y <=> x }

array.collect do |x|
  next 0 if x == nil
  next x, x*x
end

array.collect do |x|
  if x == nil
    0
  else
    [x, x*x]
  end
end

total = 0
data.each {|x| total += x }   # Sum the elements of the data array
puts total                    # Print out that sum

1.upto(10) do |i|             # 10 rows
  1.upto(10) do |i|           # Each has 10 columns
    print "#{i} "             # Print column number
  end
  print " ==> Row #{i}\n"     # Try to print row number,but get column number
end

x = y = 0             # local variables
1.upto(4) do |x;y|    # x and y are local to block
                      # x and y "shadow" the outer variables
  y = x + 1           # Use y as scratch variable
  puts y*y            # Prints 4, 9, 16, 25
end
[x,y]
# 4
# 9
# 16
# 25
# => [0, 0]

# Blocks can have more than one parameter and more than one local variable, of course.
# Here is a block with two parameters and three local variables:
# hash.each {|key,value; i,j,k| ... }

=begin

3.1.1 :095 > def two; yield 1,2; end
 => :two 
3.1.1 :096 > two { |x| p x }
1
 => 1                                                  
3.1.1 :097 > two { |*x| p x }
[1, 2]
 => [1, 2]                                             
3.1.1 :098 > two { |x,| p x }
1
 => 1

 3.1.1 :099 > def five; yield 1,2,3,4,5; end
 => :five 
3.1.1 :100 > five do |head, *body, tail|
3.1.1 :101 >   print head, body, tail
3.1.1 :102 > end
1[2, 3, 4]5 => nil

3.1.1 :103 > def hashiter; yield :a=>1, :b=>2; end
 => :hashiter 
3.1.1 :104 > hashiter {|hash| puts hash[:a] }
1
 => nil 

3.1.1 :105 > printer = lambda {|&b| puts b.call }
 => #<Proc:0x00007fd687a9e4e8 (irb):105 (lambda)> 
3.1.1 :106 > printer.call { "hi" }
hi
 => nil

=end

[1,2,3].each &->(x,y=10) { print x*y } # 10230 => [1, 2, 3]

def double(x)
  return nil if x == nil  # Return prematurely
  return x, x.dup         # Return multiple values
end

# Return the index of the first occurrence of target within array or nil
# Note that this code just duplicates the Array.index method
def find(array, target)
  array.each_with_index do |element,index|
    return index if (element == target)       # return from find
  end
  nil                                         # If we didn't find the element, return nil
end

while(line = gets.chop)
  break if line == "quit"
  puts eval(line)
end
puts "Good bye"

f.each do |line|
  break if line == "quit\n"
  puts eval(line)
end
puts "Good bye"

while(line = gets.chop)
  # A loop starts here
  next if line[0,1] == "#" # If this line is a comment, go on to the next
  puts eval(line)
  # Control goes here when the next statement is executed
end

f.each do |line|              # Iterate over the lines in file f
  next if line[0,1] == "#"    # If this line is a comment, go to the next
  puts eval(line)
  # Control goes here when the next statement is executed
end

squareroots = data.collect do |x|
  next 0 if x < 0 # Return 0 for negative values
  Math.sqrt(x)
end

squareroots = data.collect do |x|
  if (x < 0) then 0 else Math.sqrt(x) end
end

i = 0
while(i < 3)      # Prints "0123" instead of "012"
# Control returns here when redo is executed
  print i
  i += 1
  redo if i == 3
end

puts "Please enter the first word you think of"
words = %w(apple banana cherry)           # shorthand for ["apple", "banana", "cherry"]
response = words.collect do |word|        # Control returns here when redo is executed
  print word + "> "                       # Prompt the user
  response = gets.chop                    # Get a response
  if response.size == 0                   # If user entered nothing
    word.upcase!                          # Emphasize the prompt with uppercase
    redo                                  # And skip to the top of the block
  end
  response                                # Return the response
end

n = 10
n.times do |x|
  print x
  if x == 9
    n -= 1
    retry
  end
end

# This method behaves like a while loop: if x is non-nil and non-false,
# invoke the block and then retry to restart the loop and test the
# condition again. This method is slightly different than a true while loop:
# you can use C-style curly braces to delimit the loop body. And
# variables used only within the body of the loop remain local to the block.
def repeat_while(x)
  if x            # If the condition was not nil or false
    yield         # Run the body of the loop
    retry         # Retry and re-evaluate loop condition
  end
end

for matrix in data do                               # Process a deeply nested
  catch :missing_data do                            # Label this statement so
    for row in matrix do
      for value in row do
        throw :missing_data unless value            # Break out of two
# Otherwise, do some actual data processing here.
      end
    end
  end
  # We end up here after the nested loops finish processing
  # We also get here if :missing_data is thrown.
end


=begin

Object
  +--Exception
    +--NoMemoryError
    +--ScriptError
    |     +--LoadError
    |     +--NotImplementedError
    |     +--SyntaxError
    +--SecurityError       
    +--SignalException
    |     +--Interrupt
    +--SystemExit
    +--SystemStackError       
    +--StandardError
          +--ArgumentError
          +--FiberError
          +--IOError
          |     +--EOFError
          +--IndexError
          |     +--KeyError
          +--StopIteration # New
          +--LocalJumpError
          +--NameError
          |     +--NoMethodError
          +--RangeError
          |     +--FloatDomainError
          +--RegexpError
          +--RuntimeError
          +--SystemCallError
          +--ThreadError
          +--TypeError
          +--ZeroDivisionError
=end

# Defining new exception classes

class MyError < StandardError; end

# The following code defines a simple method that raises an exception if invoked with a
# parameter whose value is invalid:
def factorial(n)
  raise "bad argument" if n < 1
  return 1 if n == 1
  n * factorial(n-1)
end


# This method invokes raise with a single string argument. These are some equivalent
# ways to raise the same exception:
raise RuntimeError, "bad argument" if n < 1
raise RuntimeError.new("bad argument") if n < 1
raise RuntimeError.exception("bad argument") if n < 1

# If we want to point directly to the problem
# code, we can provide a custom stack trace as the third argument to raise with the
# Kernel method caller :
if n < 1
  raise ArgumentError, "Expected argument >= 1. Got #{n}", caller
end

begin
  # Any number of Ruby statements go here.
  # Usually, they are executed without exceptions and
  # execution continues after the end statement.
rescue
  # This is the rescue clause; exception-handling code goes here.
  # If an exception is raised by the code above, or propagates up
  # from one of the methods called above, then execution jumps here.
end


# A begin statement can have zero or more of them:
begin
  x = factorial(1)
rescue ArgumentError => ex
  puts "Try again with a value >= 1"
rescue TypeError => ex
  puts "Try again with an integer"
end

def explode                   # This method raises a RuntimeError 10% of the time
  raise "bam!" if rand(10) == 0
end

def risky
  begin
    10.times do
      explode
  end
rescue TypeError
  puts $!
end
  "hello"
end

def defuse
  begin
    puts risky
  rescue RuntimeError => e
    puts e.message
  end
end

defuse

require 'open-uri'
tries = 0                                                       # How many times have we tried to read the URL
begin                                                           # This is where a retry begins
  tries += 1                                                    # Try to print out the contents of a URL
  open('http://www.example.com/') {|f| puts f.readlines }
rescue OpenURI::HTTPError => e                                  # If we get an HTTP error
  puts e.message                                                # Print the error message
  if (tries < 4)                                                # If we haven't tried 4 times yet...
    sleep(2**tries)                                             # Wait for 2, 4, or 8 seconds
    retry                                                       # And then try again!
  end
end


# Returns value 2
begin
  return 1      # Skip to the ensure clause before returning to caller
ensure
  return 2      # Replace the return value with this new value
end
# Returns value 1
def test
  begin return 1 ensure 2 end
end

def method_name(x)
  # The body of the method goes here.
  # Usually, the method body runs to completion without exceptions
  # and returns to its caller normally.
rescue
  # Exception-handling code goes here.
  # If an exception is raised within the body of the method, or if
  # one of the methods it calls raises an exception, then control
  # jumps to this block.
else
  # If no exceptions occur in the body of the method
  # then the code in this clause is executed.
ensure
  # The code in this clause is executed no matter what happens in the
  # body of the method. It is run if the method runs to completion, if
  # it throws an exception, or if it executes a return statement.
end

# Compute factorial of x, or use 0 if the method raises an exception
y = factorial(x) rescue 0

# This is equivalent to:
y = begin
      factorial(x)
    rescue
      0
    end
s

# BEGIN and END must be followed by an open curly brace, any amount of Ruby code, and
# a close curly brace. The curly braces are required; do and end are not allowed here. For
#   example:

BEGIN {
  # Global initialization code goes here
}

END {
  # Global shutdown code goes here
}

a = 4
if (true)
  BEGIN {
    puts "if";
    puts a
  }
else
  END { puts "else" }
end

10.times {BEGIN { puts "loop" }} # 10

# This method expects an array of filenames.
# It returns an array of strings holding the content of the named files.
# The method creates one thread for each named file.
def readfiles(filenames)
  # Create an array of threads from the array of filenames.
  # Each thread starts reading a file.
  threads = filenames.map do |f|
  Thread.new { File.read(f) }
  end
  # Now create an array of file contents by calling the value
  # method of each thread. This method blocks, if necessary,
  # until the thread exits with a value.
  threads.map { |t| t.value }
end

=begin
3.1.1 :049 > f = Fiber.new {
3.1.1 :050 >   puts "Fiber says Hello"
3.1.1 :051 >   Fiber.yield
3.1.1 :052 >   puts "Fiber says Goodbye"
3.1.1 :053 > }
 => #<Fiber:0x00007f65b7d554c0 (irb):49 (created)> 
3.1.1 :054 > puts "Caller says Hello"
Caller says Hello
 => nil 
3.1.1 :055 > f.resume
Fiber says Hello
 => nil 
3.1.1 :056 > puts "Caller says Goodbye"
3.1.1 :057 > f.resume
Caller says Goodbye
Fiber says Goodbye
 => nil 

3.1.1 :058 > f = Fiber.new do |message|
3.1.1 :059 >  puts "Caller said: #{message}"
3.1.1 :060 >  message2 = Fiber.yield("Hello")
3.1.1 :061 >  puts "Caller said: #{message2}"
3.1.1 :062 >  "Fine"
3.1.1 :063 > end
 => #<Fiber:0x00007f65b7d61b08 (irb):58 (created)> 
3.1.1 :064 > response = f.resume("Hello")
3.1.1 :065 > puts "Fiber said: #{response}"
Caller said: Hello
Fiber said: Hello
 => nil 
3.1.1 :066 > response2 = f.resume("How are you?") # "How are you?" returned by Fiber.yield
3.1.1 :067 > puts "Fiber said: #{response2}"
Caller said: How are you?
Fiber said: Fine
 => nil 
s
3.1.1 :069 > def fibonacci_generator(x0,y0)
3.1.1 :070 > # Base the sequence on x0,y0
3.1.1 :071 >   Fiber.new do
3.1.1 :072 >     x,y = x0, y0    # Initialize x and y
3.1.1 :074 >     loop do         # This fiber runs forever
3.1.1 :076 >       Fiber.yield y # Yield the next number in the sequence
                   x,y = y,x+y   # Update x and y
3.1.1 :080 >     end
3.1.1 :081 >   end
3.1.1 :082 > end
 => :fibonacci_generator 
3.1.1 :083 > g = fibonacci_generator(0,1)                        
3.1.1 :084 > # Create a generator                                
3.1.1 :085 > 10.times { print g.resume, " " } # And use it
1 1 2 3 5 8 13 21 34 55  => 10
=end

# Here is another version of a Fibonacci number generator. It defines
# its own class and implements the same next and rewind API that enumerators do:
class FibonacciGenerator
  def initialize
    @x,@y = 0,1
    @fiber = Fiber.new do
      loop do
        @x,@y = @y, @x+@y
        Fiber.yield @x
      end
    end
  end

  def next
    @fiber.resume
  end

  def rewind
    @x,@y = 0,1
  end
end

g = FibonacciGenerator.new
10.times { print g.next, " " }
g.rewind; puts
10.times { print g.next, " " }

# Conversely, suppose we have an Enumerable object and want to make an enumerator-
# style generator out of it. We can use this class:
class Generator
  def initialize(enumerable)
    @enumerable = enumerable      # Remember the enumerable object
    create_fiber                  # Create a fiber to enumerate it
  end

  def next                        # Return the next element
    @fiber.resume                 # by resuming the fiber
  end 

  def rewind                      # Start the enumeration over
    create_fiber                  # by creating a new fiber
  end

  private
  def create_fiber                # Create the fiber that does the enumeration
    @fiber = Fiber.new do         # Create a new fiber
      @enumerable.each do |x|     # Use the each method
        Fiber.yield(x)            # But pause during enumeration to return values
      end
      raise StopIteration         # Raise this when we're out of values
    end
  end
end

g = Generator.new(1..10)      # Create a generator from an Enumerable like this
loop { print g.next }         # And use it like an enumerator like this
g.rewind                      # Tart over like this
g = (1..10).to_enum           # The to_enum method does the same thing
loop { print g.next }



require 'fiber'

f = g = nil

f = Fiber.new {|x|
  puts "f1: #{x}"
  x = g.transfer(x+1)
  puts "f2: #{x}"
  x = g.transfer(x+1)
  puts "f3: #{x}"
  x + 1
}
g = Fiber.new {|x|
  puts "g1: #{x}"
  x = f.transfer(x+1)
  puts "g2: #{x}"
  x = f.transfer(x+1)
}
puts f.transfer(1)

# f1: 1
# g1: 2
# f2: 3
# g2: 4
# f3: 5
# 6
#  => nil



require 'continuation'
# Global hash for mapping line numbers (or symbols) to continuations
$lines = {}

# Create a continuation and map it to the specified line number
def line(symbol)
  callcc {|c| $lines[symbol] = c }
end

# Look up the continuation associated with the number, and jump there
def goto(symbol)
  $lines[symbol].call
end

# Now we can pretend we're programming in BASIC
i = 0
line 10               # Declare this spot to be line 10
puts i += 1
goto 10 if i < 5      # Jump back to line 10 if the condition is met

line 20               # Declare this spot to be line 20
puts i -= 1
goto 20 if i > 0
