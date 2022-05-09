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
