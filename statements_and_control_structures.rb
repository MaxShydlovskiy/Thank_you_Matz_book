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





