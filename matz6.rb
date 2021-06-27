#!/usr/bin/ruby

# This is simple comments
# And now
#And for now
#Now?
#Yeahh!:)

=begin
  This is multiline comments
=end

#
#Rdoc comments use a simple markup grammar like those used in wikis.
# Separate paragraphs with a blank line.
# = Headings
#
# Headings begin with an equals sign
#
# == Sub-Headings
# The line above produces a subheading.
# === Sub-Sub-Heading
# And so on.
# = Examples
#
#   Indented lines are displayed verbatim in code font.
#     Be careful not to indent your headings and lists, though.
#
# = Lists and Fonts
#
#
# List items begin with * or -. Indicate fonts with punctuation or HTML:
# * _italic_ or <i>multi-word italic</i>
# * *bold* or <b>multi-word bold</b>
# * +code+ or <tt>multi-word code</tt>
# 1. Numbered lists begin with numbers.
# 99. Any number will do; they don't have to be sequential.
# 1. There is no way to do nested lists.
#
# The terms of a description list are bracketed:
# [item 1] This is a description of item 1
# [item 2] This is a description of item 2
#

1           # An integer literal
1.0         # A floating-point literal
'one'       # A string literal
"two"       # Another string literal
/there/     # A regular expresion literal

def ×(x,y)   # The name of this method is the Unicode multiplication sign
  x*y        # The body of this method multiplies its arguments
end