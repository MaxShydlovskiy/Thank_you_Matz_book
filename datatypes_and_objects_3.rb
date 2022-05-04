# 3.3 Arrays
[1, 2, 3]           # An array that holds three Fixnum objects
[-10...0, 0..10,]   # An array of two ranges; trailing commas are allowed
[[1,2],[3,4],[5]]   # An array of nested arrays
[x+y, x-y, x*y]     # Array elements can be arbitrary expressions
[]                  # The empty array has size 0

words = %w[this is a test]  # Same as: ['this', 'is', 'a', 'test']
open = %w| ( [ { < |        # Same as: ['(', '[', '{', '<']
white = %W(\s \t \r \n)     # Same as: ["\s", "\t", "\r", "\n"]

empty = Array.new               # []: returns a new empty array
nils = Array.new(3)             # [nil, nil, nil]: new array with 3 nil elements
zeros = Array.new(4, 0)         # [0, 0, 0, 0]: new array with 4 0 elements
copy = Array.new(nils)          # Make a new copy of an existing array
count = Array.new(3) {|i|i+1}   # [1,2,3]: 3 elements computed from index

a = [0, 1, 4, 9, 16]    # Array holds the squares of the indexes
a[0]                    # First element is 0
a[-1]                   # Last element is 16
a[-2]                   # Second to last element is 9
a[a.size-1]             # Another way to query the last element
a[-a.size]              # Another way to query the first element
a[8]                    # Querying beyond the end returns nil
a[-8]                   # Querying before the start returns nil, too

a[0] = "zero"     # => "zero" 
a[-1] = 1..16     # => 1..16 
a[8] = 64
a[-9] = 81        # => 81 
a                 # => [81, 1, 4, 9, 1..16, nil, nil, nil, 64] 

a = ('a'..'e').to_a       # => ["a", "b", "c", "d", "e"] 
a[0,0]                  # => [] 
a[1,1]                  # => ["b"] 
a[-2,2]                 # => ["d", "e"] 
a[0..2]                 # => ["a", "b", "c"] 
a[-2..-1]
a[0...-1]               # => ["a", "b", "c", "d"] 

a[0,2] = ['A', 'B']       # a becomes ['A', 'B', 'c', 'd', 'e']
a[2...5]=['C', 'D', 'E']  # a becomes ['A', 'B', 'C', 'D', 'E']
a[0,0] = [1,2,3]          # Insert elements at the beginning of a
a[0..2] = []              # Delete those elements
a[-1,1] = ['Z']           # Replace last element with another
a[-1,1] = 'Z'             # For single elements, the array is optional
a[-2,2] = nil             # Delete last 2 elements in 1.8; replace with nil in 1.9

a = [1, 2, 3] + [4, 5]    # [1, 2, 3, 4, 5]
a = a + [[6, 7, 8]]       # [1, 2, 3, 4, 5, [6, 7, 8]]
a = a + 9                 # Error: righthand side must be an array

['a', 'b', 'c', 'b', 'a'] - ['b', 'c', 'd']     # ['a', 'a']

a = []              # Start with empty array
a << 1              # a is [1]
a << 2 << 3         # a is [1, 2, 3]
a << [4, 5, 6]      # a is [1, 2, 3, [4, 5, 6]]

a = [0] * 8         # [0, 0, 0, 0, 0, 0, 0, 0]

a = [1, 1, 2, 2, 3, 3, 4]
b = [5, 5, 4, 4, 3, 3, 2]
a | b                         # [1, 2, 3, 4, 5]: duplicates are removed
b | a                         # [5, 4, 3, 2, 1]: elements are the same, but order is different
a & b                         # [2, 3, 4]
b & a                         # [4, 3, 2]

a = [0] * 8      # => [0, 0, 0, 0, 0, 0, 0, 0]

a = ('A'..'Z').to_a
a.each {|x| print x }
ABCDEFGHIJKLMNOPQRSTUVWXYZ => 
["A",                 
 "B",                 
 "C",                 
 "D",
 "E",
 "F",
 "G",
 "H",
 "I",
 "J",
 "K",
 "L",
 "M",
 "N",
 "O",
 "P",
 "Q",
 "R",
 "S",
 "T",
 "U",
 "V",
 "W",
 "X",
 "Y",
 "Z"] 

# Array methods you may want to look up include clear, compact!, delete_if,
# each_index, empty?, fill, flatten!, include?, index, join, pop, push, reverse,
# reverse_each, rindex, shift, sort, sort!, uniq!, unshift.

# 3.4 Hashes

# This hash will map the names of digits to the digits themselves
numbers = Hash.new    # Create a new, empty, hash object
numbers["one"] = 1    # Map the String "one" to the Fixnum 1
numbers["two"] = 2    # Note that we are using array notation here
numbers["three"] = 3
sum = numbers["one"] + numbers["two"]   # Retrieve values like this

# 3.4.1 Hash Literals

numbers = { "one" => 1, "two" => 2, "three" => 3 }    # => {"one"=>1, "two"=>2, "three"=>3}     Hash object
numbers = { one: '1', two: '2', three: '3' }          # => {:one=>"1", :two=>"2", :three=>"3"}  Symbol object
numbers = { one: 1, two: 2, three: 3 }                # => {:one=>1, :two=>2, :three=>3}

numbers = { :one => 1, :two => 2, }                   # Extra comma ignored

# 3.4.2 Hash Codes, Equality, and Mutable Keys

# 3.5 Ranges

1..10         # The integers 1 through 10, including 10
1.0...10.0    # The numbers between 1.0 and 10.0, excluding 10.0 itself

cold_war = 1945..1989
cold_war.include? 1985   # => true
cold_war.include? 1995   # => false

r = 'a'..'c'
r.each {|l| print "[#{l}]"}     # Prints "[a][b][c]"
r.step(2) { |l| print "[#{l}]"} # Prints "[a][c]"
r.to_a                          # => ['a','b','c']: Enumerable defines to_a

1..3.to_a       # Tries to call to_a on the number 3
(1..3).to_a     # => [1,2,3]

# 3.5.1 Testing Membership in a Range

r = 0...100             # Range
r.member? 50            # => true: 50 is a member of the range
r.include? 100          # => false: 100 is excluded from the range
r.include? 99.9         # => true: 99.9 is less than 100

triples = "AAA".."ZZZ"        # Range
triples.include? "ABC"        # => true
triples.include? "ABCD"       # => false
triples.cover? "ABCD"         # => true
triples.to_a.include? "ABCD"  # => false

# 3.6 Symbols

:symbol                     # => :symbol
:"symbol"                   # => :symbol
:'another long symbol'      # => :"another long symbol"
s = "string"                # => "string"
sym = :"#{s}"               # => :string

%s["]        # => => :"\""

=begin
3.1.1 :001 > str = "string"
 => "string" 
3.1.1 :002 > sym = str.intern
 => :string 
3.1.1 :003 > sym = str.to_sym
 => :string 
3.1.1 :004 > sym.to_s
 => "string" 
3.1.1 :005 > str = sym.id2name
 => "string"

# 3.7 True, False, and Nil
# 3.8 Objects
# 3.8.1 Object References

3.1.1 :008 > s = "Ruby"
 => "Ruby" 
3.1.1 :009 > t = s
 => "Ruby" 
3.1.1 :010 > t[-1] = ""
 => "" 
3.1.1 :011 > print s
Rub => nil 
3.1.1 :012 > t = "Java"
 => "Java" 
3.1.1 :013 > print s,t
RubJava => nil 

# 3.8.1.1 Immediate values
# 3.8.2 Object Lifetime
# 3.8.3 Object Identity
# 3.8.4 Object Class and Object Type

3.1.1 :022 > o = "test"
 => "test" 
3.1.1 :023 > o.class
 => String 
3.1.1 :024 > o.itself
 => "test"

3.1.1 :025 > Object.superclass
 => BasicObject 
3.1.1 :026 > BasicObject.superclass
 => nil

3.1.1 :027 > o.class == String
 => true 
3.1.1 :028 > o.instance_of? String
 => true

x = 1 
3.1.1 :030 > x.instance_of? Fixnum
 => true 
3.1.1 :031 > x.instance_of? Numeric
 => false 
3.1.1 :032 > x.is_a? Fixnum
 => true 
3.1.1 :033 > x.is_a? Integer
 => true 
3.1.1 :034 > x.is_a? Numeric
 => true 
3.1.1 :035 > x.is_a? Comparable
 => true 
3.1.1 :036 > x.is_a? Object
 => true 
3.1.1 :037 > Numeric === x
 => true 
3.1.1 :038 > o.respond_to? :"<<"
 => true 
3.1.1 :039 > o.respond_to? :"<<" and not o.is_a? Numeric
 => true

# 3.8.5 Object Equality
# 3.8.5.1 The equal? method

3.1.1 :040 > a = "Ruby"
 => "Ruby" 
3.1.1 :041 > b = c = "Ruby"
 => "Ruby" 
3.1.1 :042 > a.equal?(b)
 => false 
3.1.1 :043 > b.equal?(c)
 => true

a.object_id == b.object_id   # Works like a.equal?(b)

# 3.8.5.2 The == operator

3.1.1 :046 > a = "Ruby"
3.1.1 :047 > 
 => "Ruby" 
3.1.1 :048 > b = "Ruby"
 => "Ruby" 
3.1.1 :049 > a.equal?(b)
 => false 
3.1.1 :050 > a == b
 => true 

# 3.8.5.3 The eql? method

3.1.1 :051 > 1 == 1.0
 => true 
3.1.1 :052 > 1.eql?(1.0)
 => false

3.8.5.4 The === operator

3.1.1 :053 > (1..10) === 5
 => true 
3.1.1 :054 > /\d+/ === "123"
 => true 
3.1.1 :055 > String === "s"
 => true 
3.1.1 :056 > :s === "s"
 => false

3.8.5.5 The =~ operator
3.8.6 Object Order

3.1.1 :057 > 1 <=> 5
 => -1 
3.1.1 :058 > 5 <=> 5
 => 0 
3.1.1 :059 > 9 <=> 5
 => 1 
3.1.1 :060 > "1" <=> 5
 => nil 

<   Less than
<=  Less than or equal
==  Equal
>=  Greater than or equal
>   Greater than

3.1.1 :061 > 1.between?(0,10)
 => true

3.1.1 :001 > nan = 0.0/0.0;
 => NaN 
3.1.1 :002 > nan < 0
 => false 
3.1.1 :003 > nan > 0
 => false 
3.1.1 :004 > nan == 0
 => false 
3.1.1 :005 > nan == nan
 => false 
3.1.1 :006 > nan.equal?(nan)
 => true

# 3.8.7 Object Conversion

# 3.8.7.1 Explicit conversions
# The most common methods in this category
# are to_s , to_i , to_f , and to_a to convert to String , Integer , Float , and Array , respectively. 

# 3.8.7.2 Implicit conversions
# 3.8.7.3 Conversion functions
# 3.8.7.4 Arithmetic operator type coercions

3.1.1 :009 > 1.1.coerce(1)
 => [1.0, 1.1] 
3.1.1 :010 > require "rational"
 => false 
3.1.1 :011 > r = Rational(1,3)
 => (1/3) 
3.1.1 :012 > r.coerce(2)
 => [(2/1), (1/3)]

# 3.8.7.5 Boolean type conversions
# 3.8.8 Copying Objects
# 3.8.10 Freezing Objects
# 3.8.11 Tainting Objects

3.1.1 :027 > s = "untrusted"
 => "untrusted" 
3.1.1 :028 > s.taint
 => "untrusted" 
3.1.1 :029 > s.tainted?
 => false 
3.1.1 :030 > s.upcase.tainted?
 => false 
3.1.1 :031 > s[3,4].tainted?
 => false

=end
