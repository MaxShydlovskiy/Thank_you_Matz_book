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








