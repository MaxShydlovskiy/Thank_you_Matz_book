# 3.2.1.5 Here documents
#
document = <<HERE
# This is how we begin a here document
This is a string literal.
It has two lines and abruptly ends...
HERE

greeting = <<HERE + <<THERE + "World"
Hello
HERE
There
THERE

document = <<'THIS IS THE END, MY ONLY FRIEND, THE END'
.
. lots and lots of text goes here
. with no escaping at all.
.
THIS IS THE END, MY ONLY FRIEND, THE END

document = <<-"# # #"
# This is the only place we can put a comment
<html><head><title>#{title}</title></head>
<body>
<h1>#{title}</h1>
#{body}
</body>
</html>
# # #

# 3.2.1.6 Backtick command execution

%x[ls]

if windows
  listcmd = 'dir'
  else
  listcmd = 'ls'
  end
  listing = `#{listcmd}`

listing = Kernel.(listcmd)

# 3.2.1.7 String literals and mutability
10.times { puts "test".object_id }

# 3.2.2 Character Literals

?A # Character literal for the ASCII character A
?" # Character literal for the double-quote character
?? # Character literal for the question mark character

?\u2oAC == ?€  # => true: Ruby 1.9 only
?€ == "\u20AC" # => true

?\t   # Character literal for the TAB character
?\C-x # Character literal for Ctrl-X
?\111 # Literal for character whose encoding is 0111 (octal)

# 3.2.3 String Operators

planet = "Earth"
"Hello" + " " + planet # Produces "Hello Earth"

"Hello planet #" + planet_number.to_s # to_s converts to a string

"Hello planet ##{planet_number}"

greeting = "Hello"
greeting << " " << "World"
puts greeting # Outputs "Hello World"

alphabet = "A"
alphabet << ?B # "AB"
alphabet << 67 # "ABC"
alphabet << 256 # Error in Ruby ...: codes must be >=0 and < 256

ellipsis = '.'*3 # Evaluates to '...'
a = 0;
"#{a=a+1} " * 3 # Returns "1 1 1 ", not "1 2 3 "

# 3.2.4 Accessing Characters and Substrings

s = 'hello';
s[0]              # 104
s[s.length-1]     # 111
s[-1]             # 111
s[-2]             # 108
s[-s.length]      # 104
s[s.length]       # nil

s = 'hello';
s[0]              # 'h'
s[s.length-1]     # 'o'
s[-1]             # 'o'
s[-2]             # 'l'
s[-s.length]      # 'h'
s[s.length]       # 'nil'

s[0] = ?H   # Replace first character with a capital H
s[-1] = ?O  # Replace last character with a capital O
s[s.length] = ?! # ERROR! Can't assign beyond the end of the string

s = "hello" # Begin with a greeting
s[-1] = "" # Delete the last character; s is now "hell"
s[-1] = "p!" # Change new last character and add one; s is now "help!"

s = "hello"
s[0,2]    # "he"
s[-1,1]  # "o": returns a string, not the character code ?o
s[0,0]   # "": a zero-length substring is always empty
s[0,10]  # "hello": returns all the characters that are available
s[s.length,1] # "": there is an empty string immediately beyond the end
s[s.length+1,1] # nil: it is an error to read past that
s[0,-1]  # nil: negative lengths don't make any sense

s = "hello"
s[0,1] = "H" # Replace first letter with a capital letter
s[s.length,0] = " world" # Append by assigning beyond the end of the string
s[5,0] = "," # Insert a comma, without deleting anything
s[5,6] = ""  # Delete with no insertion; s == "Hellod"

s = "hello"
s[2..3] # "ll": characters 2 and 3
s[-3..-1] # "llo": negative indexes work, too
s[0..0] # "h": this Range includes one character index
s[0...0] # "": this Range is empty
s[2..1] # "": this Range is also empty
s[7..10] # nil: this Range is outside the string bounds
s[-2..-1] = "p!" # Replacement: s becomes "help!"
s[0...0] = "Please " # Insertion: s becomes "Please help!"
s[6..10] = "" # Deletion: s becomes "Please!"

s = "hello" # Start with the word "hello"
while(s["l"]) # While the string contains the substring "l"
s["l"] = "L"; # Replace first occurrence of "l" with "L"
end # Now we have "heLLo"

s[/[aeiou]/] = '*' # Replace first vowel with an asterisk

# 3.2.5 Iterating Strings

s = "¥1000"
s.each_char {|x| print "#{x} " }          # ¥ 1 0 0 0  => "¥1000"
0.upto(s.size-1) {|i| print "#{s[i]} "}   # ¥ 1 0 0 0  => "¥1000"

# 3.2.6 String Encodings and Multibyte Characters
# 3.2.6.1 Multibyte characters in Ruby 1.9

# -*- coding: utf-8 -*- # Specify Unicode UTF-8 characters
# This is a string literal containing a multibyte multiplication character
s = "2×2=4"
# The string contains 6 bytes which encode 5 characters
s.length # => 5: Characters: '2'  '×'  '2'  '='
s.bytesize # => 6: Bytes (hex): 32 c3 97 32  3d  '4'  34

# -*- coding: utf-8 -*-
s = "2×2=4" # Note multibyte multiplication character
s.encoding  # => <Encoding: UTF-8>
t = "2+2=4" # All characters are in the ASCII subset of UTF-8
t.encoding  # => <Encoding: ASCII-8BIT>

text = stream.readline.force_encoding("utf-8")
bytes = text.dup.force_encoding(nil) # nil encoding means binary

s = "\xa4".force_encoding("utf-8") # This is not a valid UTF-8 string
s.valid_encoding? # => false

# -*- coding: utf-8 -*-
euro1 = "\u20AC"
# Start with the Unicode Euro character
puts euro1 # Prints "€"
euro1.encoding # => <Encoding:UTF-8>
euro1.bytesize # => 3

euro2 = euro1.encode("iso-8859-15") # Transcode to Latin-15
puts euro2.inspect # Prints "\xA4"
euro2.encoding # => <Encoding:iso-8859-15>
euro2.bytesize # => 1

euro3 = euro2.encode("utf-8") # Transcode back to UTF-8
euro1 == euro3                # => true

# Interpret a byte as an iso-8859-15 codepoint, and transcode to UTF-8
byte = "\xA4"
char = byte.encode("utf-8", "iso-8859-15")

text = bytes.encode(to, from)
text = bytes.dup.force_encoding(from).encode(to)

# The iso-8859-1 encoding doesn't have a Euro sign, so this raises an exception
"\u20AC".encode("iso-8859-1")

# 3.2.6.2 The Encoding class

Encoding::ASCII_8BIT # Also ::BINARY
Encoding::UTF_8      # UTF-8-encoded Unicode characters
Encoding::EUC_JP     # EUC-encoded Japanese
Encoding::SHIFT_JIS  # Japanese: also ::SJIS, ::WINDOWS_31J, ::CP932

encoding = Encoding.find("utf-8")

# 3.2.6.3 Multibyte characters in Ruby 

$KCODE = "u" # Specify Unicode UTF-8, or start Ruby with -Ku option
require "jcode"  # Load multibyte character support
mb = "2\303\2272=4" # This is "2×2=4" with a Unicode multiplication sign
mb.length # => 6: there are 6 bytes in this string
mb.jlength # => 5: but only 5 characters
mb.mbchar? # => 1: position of the first multibyte char, or nil
mb.each_byte do |c| # Iterate through the bytes of the string.
  print c, " " # c is Fixnum
end # Outputs "50 195 151 50 61 52 "
mb.each_char do |c| # Iterate through the characters of the string
  print c, " " # c is a String with jlength 1 and variable length
end # Outputs "2 × 2 = 4 "