# 3.1 Integer

# 3.1.1 Integer Literals

0
123
1234567890

1_000_000_000 # One billion

0377           # Octal representation of 255
0b1111_1111    # Binary representation of 255
0xFF           # Hexadecimal representation of 255

# 3.1.2 Floating-Point Literals

0.0      
-3.14
6.02e23       # This means 6.02 × 1023
1_000_000.01  # One million and a little bit more

# 3.1.3 Arithmetic in Ruby

x = 5/2 # 2
y = 5.0/2 # 2.5
z = 5/2.0 # 2.5
x = 5%2 # 1
x = 1.5%0.4 # 0.3

x**4          # This is the same thing as x*x*x*x
x**-1         # The same thing as 1/x
x**(1/3.0)    # The cube root of x
x**(1/4)      # Oops! Integer division means this is x**0, which is always 1
x**(1.0/4.0)  # This is the fourth-root of x

# 3.1.4  Binary Floating-Point and Rounding Errors

0.4 - 0.3 == 0.1    # Evaluates to false in most implementations

# 3.2 Text

# 3.2.1  String Literals

# 3.2.1.1  Single-quoted string literals

'This is a simple Ruby string literal'

'Won\'t you read O\'Reilly\'s book?'

'This string literal ends with a single backslash: \\'
'This is a backslash-quote: \\\''
'Two backslashes: \\\\'

'a\b' == 'a\\b'

'This is a long string literal \
that includes a backslash and a newline'

message = 
'These three literals are '\
'concatenated into one by the interpreter. '\
'The resulting string contains no newlines.'

# 3.2.1.2  Double-quoted string literals

"\t\"This quote begins with a tab and ends with a newline\"\n"
"\\"  # A single backslash

"360 degrees=#{2*Math::PI} radians" # "360 degrees=6.28318530717959 radians"

$salutation = 'hello'     # Define a global variable
"#$salutation world"      # Use it in a double-quoted string

"My phone #: 555-1234"                # No escape needed
"Use \#{ to interpolate expressions"  # Escape #{ with backslash


"This string literal
has two lines \
but is written on three"

# 3.2.1.3  Unicode escapes

"\u00D7"       # => "×": leading zeros cannot be dropped
"\u20ac"       # => "€": lowercase letters are okay

"\u{A5}"      # => "¥": same as "\u00A5"
"\u{3C0}"     # Greek lowercase pi: same as "\u03C0"
"\u{10ffff}"  # The largest Unicode codepoint

money = "\u{20AC A3 A5}"  # => "€£¥"

money = "\u{20AC 20 A3 20 A5}"  # => "€ £ ¥"

# 3.2.1.4  Arbitrary delimiters for string literals

%q(Don't worry about escaping ' characters!)
%Q|"How are you?", he said|
%-This string literal ends with a newline\n-  # Q omitted in this one

%q_This string literal contains \_underscores\__
%Q!Just use a _different_ delimiter\!

# XML uses paired angle brackets:
%<<book><title>Ruby in a Nutshell</title></book>>  # This works
# Expressions use paired, nested parens:
%((1+(2*3)) = #{(1+(2*3))})                        # This works, too
%(A mismatched paren \( must be escaped)           # Escape needed here
