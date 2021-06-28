#!/usr/bin/ruby

x = 5/2             # => 2
y = 5.0/2           # => 2.5
z = 5/2.0           # => 2.5

x = 5%2             # => 1
x = 1.5%0.4         # => 0.3

x**4                # Same: x*x*x*x
x**-1               # Same: 1/x
x**(1/3.0)          # The cube root of x
x**(1/4)            # Same: x**0,means alway 1
x**(1.0/4.0)        # This is fourth-root of x

0.4 - 0.3 == 0.1    # => false (binary is different)

'Simple Ruby string literal'         # => "Simple Ruby string literal"

'Won\'t you read O\'Reilly\'s book?' # => "Won't you read O'Reilly's book?" 

'This string literal ends with a single backslash: \\'
'This is a backslash-quote: \\\''
'Two backslashes: \\\\'

'a\b' == 'a\\b'         # => true

'This is a long string literal \
that includes a backslash and a newline'   # => "This is a long string literal \\\nthat includes a backslash and a newline"

"\t\"This quote begins with a tab and ends with a newline\"\n"   # => Not been changed :)

"\s\
"      # => " "
