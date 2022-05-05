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


# 4.5 Assignments

x = 1
x += 1              # => 2
x,y,z = 1,2,3       # => [1, 2, 3]
x = y = 0           # Set x and y to 0

# 4.5.1 Assigning to Variables
# 4.5.3 Assigning to Attributes and Array Elements
# 4.5.4 Abbreviated Assignment
# 4.5.5 Parallel Assignment
# 4.5.5.1 Same number of lvalues and rvalues

# Declare class A as a subclass of B
class A < B
end

=begin
3.1.1 :045 > String < Object
 => true 
3.1.1 :046 > Object > Numeric
 => true 
3.1.1 :047 > Numeric < Integer
 => false 
3.1.1 :048 >  String < Numeric
 => nil 

x < 0 || y < 0 || z < 0    # Are any of the coordinates negative?

# If the argument x is nil, then get its value from a hash of user preferences
# or from a constant default value.
x = x || preferences[:x] || Defaults::X

(1 || 2) && nil
=> nil 

The ! operator is at the highest precedence. This means that if you want to compute
the logical inverse of an expression that itself uses operators, you must use parentheses:
!(a && b)

Incidentally, one of the principles of Boolean logic allows the expression above to be
rewritten as:
!a || !b

The and , or , and not operators are low-precedence versions of && , || , and ! . One reason
to use these variants is simply that their names are English and this can make your code
easier to read. Try reading this line of code, for example:
if x > 0 and y > 0 and not defined? d then d = Math.sqrt(x*x + y*y) end

Boolean expression such as the following that assigns values to variables until it
encounters a false value:
if a = f(x) and b = f(y) and c = f(z) then d = g(a,b,c) end
s
You should note that and and or have the same precedence (and not is just slightly
higher). Because and and or have the same precedence, and && and || have different
precedences, the following two expressions compute different values:
x || y && nil   # && is performed first => x
x or y and nil  # evaluated left-to-right => nil

=end

(1..10).each {|x| print x if x==3..x==5 }   # 345 => 1..10

# Prints "3". Flips and flops back when x==3
(1..10).each {|x| print x if x==3..x>=3 }     # Prints "3". Flips when x == 3 and flops when x==4
(1..10).each {|x| print x if x==3...x>=3 }    # Prints "334"

ARGF.each do |line|                           # For each line of standard in or of named files
  print line if line=~/TODO/..line=~/^$/      # Print lines when flip-flop is true
end

$state = false
def flipflop(x)
  if !$state
    result = (x == 3)
    if result
      $state = !(x == 5)
    end
    result
  else
    $state = !(x == 5)
    true
  end
end

(1..10).each {|x| print x if flipflop(x) }  # => 345

# The following function simulates the behavior of the three-dot flip-flop x==3...x>=3 :
$state2 = false
def flipflop2(x)
  if !$state2
    $state2 = (x == 3)
  else
    $state2 = !(x >= 3)
    true
  end
end

# Now try it out
(1..10).each {|x| print x if x==3...x>=3 }      # Prints "34"
(1..10).each {|x| print x if flipflop2(x) }     # Prints "3434"

# "You have #{n} #{n==1 ? 'message' : 'messages'}"

=begin
The ?: operator has fairly low precedence, which means that it is usually not necessary
to put parentheses around the operands. If the first operand uses the defined? operator,
or if the second and third operands perform assignments, then parentheses are neces-
sary. Remember that Ruby allows method names to end with a question mark. If the
first operand of the ?: operator ends with an identifier, you must put parentheses
around the first operand or include a disambiguating space between that operand and
the question mark. If you don’t do this, the Ruby interpreter thinks that the question
mark of the operator is part of the previous identifier. For example:
x==3?y:z
3==x?y:z
(3==x)?y:z
3==x ?y:z

The question mark must appear on the same line as the first argument. In Ruby 1.8,
the colon must appear on the same line as the second argument. In Ruby 1.9, however,
a newline is allowed before the colon. You must follow the colon by a space in this case,
however, so it doesn’t appear to introduce a symbol literal.
Table 4-2 (earlier in this chapter) says that the ?: operator is right-associative. If the
operator is used twice in the same expression, the rightmost one is grouped:
a ? b : c ? d : e      # This expression...
a ? b : (c ? d : e)    # is evaluated like this..
(a ? b : c) ? d : e    # NOT like this

This kind of ambiguity is actually fairly rare with the ?: operator. The following ex-
pression uses three conditional operators to compute the maximum value of three
variables. No parentheses are required (although spaces are required before the
question marks), as there is only one possible way to parse the statement:
max = x>y ? x>z ? x : z : y>z ? y : z
max = x>y ? (x>z ? x : z) : (y>z ? y : z)
=end

x = y = z = 0             # => 0
x = (y = (z = 0))         # => 0

y = f(x) if defined? f(x) # => nil

=begin

Operand expression type                                           Return value
Reference to defined local variable                             "local-variable"
Reference to defined block local variable (Ruby 1.8 only)       "local-variable(in-block)"
Reference to defined global variable                            "global-variable"
Special regular expression global variables, $&,$+,$`,$',
and $1 to $9 , when defined
following a successful match (Ruby 1.8 only)                    Name of variable, as a string
Reference to defined constant                                   "constant"
Reference to defined instance variable                          "instance-variable"
Reference to defined class variable                             "class variable" (note no hyphen)
nil                                                             "nil" (note this is a string)
true , false                                                    "true","false"
self                                                            "self"
yield when there is a block to yield to 
(see also Kernel method block_given? )                          "yield"
super when in context where it is allowed                       "super"
Assignment (assignment is not actually performed)               "assignment"
Method invocation, including operators defined as methods
 (method is not actually invoked
and need not have correct number of arguments; 
see also Object.respond_to? )                                   "method"
Any other valid expression, including literals 
and built-in operators                                          "expression"
Any expression that uses an undefined variable 
or method name, or that uses yield or
super where they are not allowed                                 nil

3.1.1 :043 > defined? a and defined? b
 => nil 
3.1.1 :044 > defined? a && defined? b
 => "expression"
=end


