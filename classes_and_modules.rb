# Classes are created in Ruby with the class keyword:
class Point
end

p = Point.new
p.class        # => Point
p.is_a? Point  # => true


# Initialiting a Point
class Point
  def initialize(x,y)
    @x, @y = x, y
  end
end

class Point
  def initialize(x,y)
    @x, @y = x, y
  end
  def to_s        # Return a String that represents this point
    "(#@x,#@y)"   # Just interpolate the instance variables into a string
  end
end

p = new Point(1,2)   # Create a new Point object
puts p               # Displays "(1, 2)"

class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def x         # The accessor ( or getter ) method for @x
    @x
  end

  def y         # The accessor method for @y
    @y
  end
end

p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)

class MutablePoint
  def initialize(x,y); @x, @y = x, y; end

  def x; @x; end  # The getter method for @x
  def y; @y; end  # The getter method for @y

  def x=(value)   # The getter method for @x
    @x = value
  end

  def y=(value)    # The setter method for @y
    @y = value
  end
end

p = Point.new(1,1)
p.x = 0
p.y = 0


class Point
  attr_accessor :x, :y # Define accessor methods for our instance variables
end

class Point
  attr_reader :x, :y  # Define reader methods for our instance variables
end 

attr :x         # Define a trivial getter method x for @x
attr :y, true   # Define getter and setter methods for @y



class Point
  attr_reader :x, :y      # Define accessor methods for our instance variables

  def initialize(x,y)
    @x,@y = x, y
  end

  def +(other)                # Define + to do vector addition
    Point.new(@x + other.x, @y + other.y)
  end

  def -@                      # Define unary minus to negate both coordinates
    Point.new(-@x, -@y)
  end

  def *(scalar)               # Define * to perform scalar multiplication
    Point.new(@x*scalar, @y*scalar)
  end
end


# Define [] method to allow a Point to look like an array or
# a hash with keys :x and :y
# def [](index)
  # case index
  # when 0, -2: @x          # Index 0 (or -2) is the X coordinate
  # when 1, -1: @y          # Index 1 (or -1) is the Y coordinate
  # when :x, "x": @x        # Hash keys as symbol or string for X
  # when :y, "y": @y        # Hash keys as symbol or string for Y
  # else nil
  # end
# end

# This iterator passes the X coordinate to the associated block, and then
# passes the Y coordinate, and then returns. It allows us to enumerate
# a point as if it were an array with two elements. This each method is
# required by the Enumerable module.
def each
  yield @x
  yield @y
end

p = Point.new(1,2)
p.each {|x| print x }     # Prints "12"

# Is the point P at the origin?
p.all? {|x| x == 0 } # True if the block is true for all elements

def ==(o)                     # Is self == 0?
  if o.is_a? Point            # If 0 is a Point object
    @x==o.x && @y==o.y        # then compare the fields
  elsif                       # If 0 is not a Point
    false                     # then, by definition, self != 0
  end
end

# Our eql? methodwould look much like the == method, 
# but it would use eql? to compare point coordinates instead of == :

def eql?(o)
  if o.instance_of? Point
    @x.eql?(o.x) && @y.eql?(o.y)
  elsif
    false
  end
end

def hash
  code = 17
  code = 37*code + @x.hash
  code = 37*code + @y.hash
  # Add lines like this for each significant instance variable
  code # Return the resulting code
end



# The following code is our implementation of <=> . There are two things to note about it. First, it doesn’t bother with
# the Math.sqrt method and instead simply compares the sum of the squares of the coordinates.
# Second, after computing the sums of the squares, it simply delegates to the <=> operator of the Float class:

include Comparable        # Mix in methods from the Comparable module.
# Define an ordering for points based on their distance from the origin.
# This method is required by the Comparable module.
def <=>(other)
  return nil unless other.instance_of? Point
  @x**2 + @y**2 <=> other.x**2 + other.y**2
end

p,q = Point.new(1,0), Point.new(0,1)
p == q            # => false: p is not equal to q
p < q             # => false: p is not less than q
p > q             # => false: p is not greater than q



def add!(p)           # Add p to self, return modified self
  @x += p.x
  @y += p.y
  self
end


def add(p)        # A nonmutating version of add!
  q = self.dup    # Make a copy of self
  q.add!(p)       # Invoke the mutating method on the copy
end

Struct.new("Point", :x, :y)   # Creates new class Struct::Point
Point = Struct.new(:x, :y)    # Creates new class, assigns to Point

# Naming Anonymous Classes
C = Class.new   # A new class with no body, assigned to a constant
c = C.new       # Create an instance of the class
c.class.to_s    # => "C": constant name becomes class name

p = Point.new(1,2)  # => #<struct Point x=1, y=2>
p.x                 # => 1
p.y                 # => 2
p.x = 3             # => 3
p.x                 # => 3

p[:x] = 4                       # => 4: same as p.x =
p[:x]                           # => 4: same as p.x
p[1]                            # => 2: same as p.y
p.each {|c| print c}            # prints "42"
p.each_pair {|n,c| print n,c }  # prints "x4y2"

q = Point.new(4,2)
q == p              # => true
h = {q => 1}        # Create a hash using q as a key
h[p]                # => 1: extract value using p as key
q.to_s              # => "#<struct Point x=4, y=2>"



Point = Struct.new(:x, :y)
class Point
  def add!(other)
    self.x += other.x
    self.y += other.y
    self
  end
  include Comparable      # Include a module for the class
  def <=>(other)          # Define the <=> operator
    return nil unless other.instance_of? Point
    self.x**2 + self.y**2 <=> other.x**2 + other.y**2
  end
end

Point = Struct.new(:x, :y)
class Point
  undef x=,y=,[]=
end





