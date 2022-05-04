class Ambiguous
  def x; 1; end # A method named "x". Always returns 1

  def test
    puts x      # No variable has been seen; refers to method above: prints 1
                # The line below is never evaluated, because of the "if false" clause. But
                # the parser sees it and treats x as a variable for the rest of the method.
    x = 0 if false

    puts x      # x is a variable, but has never been assigned to: prints nil

    x = 2       # This assignment does get evaluated
    puts x      # So now this line prints 2
  end
end

x, y, z = 1, 2, 3   # => [1, 2, 3]
x,y = y,x           # => [2, 1]
x = y; y = x        # => 1
x = 1, 2, 3         # => [1, 2, 3]

x, = 1, 2, 3        # x => 1
x, y, z = [1, 2, 3] # Same as x,y,z = 1,2,3
x = [1,2]           # x becomes [1,2]: this is not parallel assignment
x, = [1,2]          # x becomes 1: the trailing comma makes it parallel

x, y, z = 1, 2      # x=1; y=2; z=nil
x, y = 1, 2, 3      # x=1; y=2; 3 is not assigned anywhere

x, y, z = 1, *[2,3] # Same as x,y,z = 1,2,3

x,*y = 1, 2, 3    # x = 1; y = [2, 3]
x,*y = 1, 2       # x = 1; y = [2]
x,*y = 1          # x = 1; y = []

x, y, *z = 1, *[2,3,4]    # x=1; y=2; z=[3,4]

# x,(y,z) = a, b    => x = a; y,z = b

x,y,z = 1,[2,3]             # No parens: x=1;y=[2,3];z=nil
x,(y,z) = 1,[2,3]           # Parens: x=1;y=2;z=3
a,b,c,d = [1,[2,[3,4]]]     # No parens: a=1;b=[2,[3,4]];c=d=nil
a,(b,(c,d)) = [1,[2,[3,4]]] # Parens: a=1;b=2;c=3;d=4

1 + 2 * 3      # => 7
(1 + 2) * 3    # => 9

(0b1011 << 1).to_s(2)    # => "10110" 
(0b10110 >> 2).to_s(2)   # => "101"

=begin

3.1.1 :060 > message = "hello"
 => "hello" 
3.1.1 :061 > messages = []
 => [] 
3.1.1 :062 > message << " world"
 => "hello world" 
3.1.1 :063 > messages << message
 => ["hello world"] 
3.1.1 :064 > STDOUT << message
hello world => #<IO:<STDOUT>> 

=end

(0b1010 & 0b1100).to_s(2)    # => "1000"
(0b1010 | 0b1100).to_s(2)    # => "1110"
(0b1010 ^ 0b1100).to_s(2)    # => "110"
