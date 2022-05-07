# Define a method named 'factorial' with a single parameter 'n'
def factorial(n)
  if n < 1                              # Test the argument value for validity
    raise "argument must be > 0"
  elsif n == 1                          # If the argument is 1
    1                                   # then the value of the method invocation is 1
  else                                  # Otherwise, the factorial of n is n times
    n * factorial(n-1)                  # the factorial of n-1
  end
end


# In the following variant of the factorial method, the return keyword is required:
def factorial(n)
  raise "bad argument" if n < 1
  return 1 if n == 1
  n * factorial(n-1)
end

# Convert the Cartesian point (x,y) to polar (magnitude, angle) coordinates
def polar(x,y)
  return Math.hypot(y,x), Math.atan2(y,x)
end

# Instead of using the return statement with multiple values, we can simply create an array of values ourselves:

# Convert polar coordinates to Cartesian coordinates
def cartesian(magnitude, angle)
  [magnitude*Math.cos(angle), magnitude*Math.sin(angle)]
end


# Methods of this form are typically intended for use with parallel assignment
# so that each return value is assigned to a separate variable:
distance, theta = polar(x,y)
x,y = cartesian(distance,theta)


# Invoking method on object
first = text.index(pattern)

# Defining Singleton Methods

o = "message"   # A string is an object
def o.printme   # Define a singleton method for this object
  puts self
end
o.printme       # Invoke the singleton

# Undefining Methods

def sum(x,y); x+y; end  # Define a method
puts sum(1,2)           # Use it
undef sum               # And undefine it

# Operator Methods

def +(other)                    # Define binary plus operator: x+y is x.+(y)
  self.concatenate(other)
end

# Method Alies

alias aka also_known_as           # alias new_name existing_name

def hello                         # A nice simple method
  puts "Hello World"              # Suppose we want to augment it...
end

alias original_hello hello        # Give the method a backup name

def hello                         # Now we define new maethod with old name
  puts "Your attention please"    # That does some stuff
  original_hello                  # Then calls the original method
  puts "This has been a test"     # Then doe some more stuff
end

# Parentheses are omitted from method invocations in many common Ruby idioms. The
# following two lines of code, for example, are equivalent:
puts "Hello World"
puts("Hello World")

greeting = "Hello"
size = greeting.length

size = greeting.length()    # Method invocation


x = 3             # x is a number
x.between? 1,5    # same as x.between?(1,5)

def sum x, y
  x+y
end


def prefix(s, len=1)
  s[0,len]
end
# => :prefix

prefix("Ruby", 3)  # => "Rub"
prefix("Ruby")     # => "R"

# Return the last character of s or the substring from index to the end
def suffix(s, index=s.size-1)
  s[index, s.size-index]
end
# => :suffix

# Append the value x to the array a, return a.
# If no array is specified, start with an empty one.
def append(x, a=[])
  a << x
end
# => :append

# Return the largest of the one or more arguments passed
def max(first, *rest)
  # Assume that the required first argument is the largest
  max = first
  # Now loop through each of the optional arguments looking for bigger ones
  rest.each {|x| max = x if x > max }
  # Return the largest one we found
  max
end
# => :max

max(1)          # => 1
max(1, 2)       # => 2
max(1, 2, 3)    # => 3

data = [3, 2, 1]
m = max(*data)   # => 3

m = max(data)    # => [3, 2, 1]

max(*"hello world".each_char) # => "w"

# This method returns an array a of n numbers. For any index i, 0 <= i < n,
# the value of element a[i] is m*i+c. Arguments n, m, and c are passed
# as keys in a hash, so that it is not necessary to remember their order.
def sequence(args)
  # Extract the arguments from the hash.
  # Note the use of the || operator to specify defaults used
  # if the hash does not define a key that we are interested in.
  n = args[:n] || 0
  m = args[:m] || 1
  c = args[:c] || 0
  a = []                        # Start with an empty array
  n.times {|i| a << m*i+c }     # Calculate the value of each array element
  a                             # Return the array
end

sequence({:n=>3, :m=>5})    # => [0, 5, 10]
sequence(:m=>3, :n=>5)      # => [0, 3, 6, 9, 12]
sequence c:1, m:3, n:5      # => [1, 4, 7, 10, 13]


# Generate a sequence of n numbers m*i + c and pass them to the block
def sequence2(n, m, c)
  i = 0
  while(i < n)        # loop n times
    yield i*m + c     # pass next element of the sequence to the block
    i += 1
  end
end

# Here is how you might use this version of the method
sequence2(5, 2, 2) {|x| puts x }
# 2
# 4
# 6
# 8
# 10
# => nil

def sequence3(n, m, c, &b)    # Explicit argument to get block as a Proc
  i = 0
  while(i < n)
    b.call(i*m + c)           # Invoke the Proc with its call method
    i += 1
  end
end

# Note that the block is still passed outside of the parentheses
sequence3(5, 2, 2) {|x| puts x }
# 2
# 4
# 6
# 8
# 10
# => nil

def sequence5(args, &b) # Pass arguments as a hash and follow with a block
  n, m, c = args[:n], args[:m], args[:c]
  i = 0
  while(i < n)
    b.call(i*m + c)
    i += 1
  end
end

# Expects one or more arguments, followed by a block
def max(first, *rest, &block)
  max = first
  rest.each {|x| max = x if x > max }
  block.call(max)
  max
end

a, b = [1,2,3], [4,5]
sum = a.inject(0) {|total,x| total+x }     # => 6
sum = b.inject(sum) {|total,x| total+x }   # => 15

a, b = [1,2,3], [4,5]                     # Start with some data.
summation = Proc.new {|total,x| total+x } # A Proc object for summations.
sum = a.inject(0, &summation)             # => 6
sum = b.inject(sum, &summation)           # => 15

words = ['and', 'but', 'car']           # An array of words
uppercase = words.map &:upcase          # => ["AND", "BUT", "CAR"]
upper = words.map {|w| w.upcase }       # => ["AND", "BUT", "CAR"]

# This method creates a proc from a block
def makeproc(&p) # Convert associated block to a Proc and store in p
  p              # Return proc object
end

# With a makeproc method like this defined, we can create a Proc object for ourselves:
adder = makeproc {|x,y| x+y }

sum = adder.call(2,2)
# => 4

p = Proc.new {|x,y| x+y }

def invoke(&b)
  b.call
end
# Equivalent
def invoke
  Proc.new.call
end

is_positive = lambda {|x| x > 0 }

succ = lambda {|x| x+1} # Creating lambda method

succ = ->(x){ x+1 } # Lambda literal
succ.call(2)        # => 3

# This lambda takes 2 args and declares 3 local vars
# f = ->(x,y; i,j,k) { ... }

zoom = ->(x,y,factor=2) { [x*factor, y*factor] }

succ = ->x { x+1 }
# f = -> x,y; i,j,k { ... }
zoom = ->x,y,factor=2 { [x*factor, y*factor] }

def compose(f,g)                              # Compose 2 lambdas
  ->(x) { f.call(g.call(x)) }
end

succOfSquare = compose(->x{x+1}, ->x{x*x})
succOfSquare.call(4)                          # => 17: Computes (4*4)+1

data.sort {|a,b| b-a }    # The block version
data.sort &->(a,b){ b-a } # The lambda literal version

f = Proc.new {|x,y| 1.0/(1.0/x + 1.0/y) }
z = f.call(x,y)

z = f[x,y]
z = f.(x,y)

=begin
lambda{||}.arity    => 0. No arguments expected
=end
lambda{|x| x}.arity     # => 1. One argument expected
lambda{|x,y| x+y}.arity # => 2. Two arguments expected

lambda {|x| x*x } == lambda {|x| x*x }  # => false

p = lambda {|x| x*x }
q = p.dup
p == q                          # => true: the two procs are equal
p.object_id == q.object_id      # => false: they are not the same object

def test
  puts "entering method"
  1.times { puts "entering block"; return } # Makes test method return
  puts "exiting method" # This line is never executed
end
test

def test
  puts "entering method"
  p = Proc.new { puts "entering proc"; return }
  p.call                # Invoking the proc makes method return
  puts "exiting method" # This line is never executed
end
test

def procBuilder(message)            # Create and return a proc
  Proc.new { puts message; return } # return returns from procBuilder
  # but procBuilder has already returned here!
end

def test
  puts "entering method"
  p = procBuilder("entering proc")
  p.call                # Prints "entering proc" and raises LocalJumpError!
  puts "exiting method" # This line is never executed
end
test

def test
  puts "entering method"
  p = lambda { puts "entering lambda"; return }
  p.call                # Invoking the lambda does not make the method return
  puts "exiting method" # This line *is* executed now
end
test

def lambdaBuilder(message)        # Create and return a lambda
  lambda { puts message; return } # return returns from the lambda
end

def test
  puts "entering method"
  l = lambdaBuilder("entering lambda")
  l.call                # Prints "entering lambda"
  puts "exiting method" # This line is executed
end
test

# multiply each element of the data array by n
def multiply(data, n)
  data.collect {|x| x*n }
end

puts multiply([1,2,3], 2)   # => 2, 4, 6

# Return a lambda that retains or "closes over" the argument n
def multiplier(n)
  lambda {|data| data.collect{|x| x*n } }
end
doubler = multiplier(2)       # Get a lambda that knows how to double
puts doubler.call([1,2,3])    # => 2, 4, 6

# Return a pair of lambdas that share access to a local variable.
def accessor_pair(initialValue=nil)
  value = initialValue                # A local variable shared by the returned lambdas.
  getter = lambda { value }           # Return value of local variable.
  setter = lambda {|x| value = x }    # Change value of local variable.
  return getter,setter                # Return pair of lambdas to caller.
end

getX, setX = accessor_pair(0)         # Create accessor lambdas for initial value 0.
puts getX[]                           # Prints 0. Note square brackets instead of call.
setX[10]                              # Change the value through one closure.
puts getX[]                           # Prints 10. The change is visible through the other.

# Return an array of lambdas that multiply by the arguments
def multipliers(*args)
  x = nil
  args.map {|x| lambda {|y| x*y }}
end

double,triple = multipliers(2,3)
puts double.call(2)
# => 4

# Return a lambda that retains or "closes over" the argument n
def multiplier(n)
  lambda {|data| data.collect{|x| x*n } }
end
doubler = multiplier(2)         # Get a lambda that knows how to double
puts doubler.call([1,2,3])      # Prints 2,4,6

eval("n=3", doubler.binding) # Or doubler.binding.eval("n=3") in Ruby 1.9
puts doubler.call([1,2,3])   # Now this prints 3,6,9!
# So we could replace the eval invocation above wich:
eval("n=3", doubler)









