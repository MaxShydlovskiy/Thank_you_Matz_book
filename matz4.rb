#!/usr/bin/ruby

def square(x)     # Define a method named square with one parameter x
  x*x             # Return x squared  
end               # End of the method

def Math.square(x) # Define a class method of the Math module
  x*x 
end 

x += 1    # Increment x: note Ruby does not have ++.
y -= 1    # Decrement y: no -- operator, either

x, y = 1, 3     # Same as x = 1; y =2
a, b = b, a     # Swap the value of two variables
x,y,z = [1,2,3] # Array elements automatically assigned to variables

# Define a method to convert Cartesian (x,y) coordinates to Polar
def polar(x,y)
  theta = Math.atan2(y,x)   # Compute the angle
  r = Math.hypot(x,y)       # Compute the distance
  [r, theta]                # The las expression is the return value
end

# Here's how we use this method with parallel assignment
distance, angle = polar(2,2)

0.x=(1)      # Normal method invocation syntax
0.x = 1      # Method invocation through assigment
