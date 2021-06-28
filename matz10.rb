#!/usr/bin/ruby

"%s: %f" % ["pi", Math::PI]             # => "pi: 3.141593"
"pi is about %.4f" % Math::PI           # => "pi is about 3.1416"

sprintf("pi is about %.4f", Math::PI)   # => "pi is about 3.1416"

"360 degrees=#{2*Math::PI}"             # => "360 degrees=6.283185307179586"

$global = 'hi'                          # => "hi"
"#$global"                              # => "hi"

"My phone #: 222-22"                    # => "My phone #: 222-22"
"Use \#{ to interpolate expressions"    # => "Use \#{ to interpolate expressions"

"This string literal
has two lines \
but is written on three"                # => => "This string literal\nhas two lines but is written on three"

=begin
  
\x              A backslash before any character x is equivalent to the character x by itself, unless x is a line terminator
                or one of the special characters abcefnrstuvxCM01234567 . This syntax is useful to escape the special
                meaning of the \ , # , and " characters.

\a              The BEL character (ASCII code 7). Rings the console bell. Equivalent to \C-g or \007 .

\b              The Backspace character (ASCII code 8). Equivalent to \C-h or \010 .

\e              The ESC character (ASCII code 27). Equivalent to \033 .

\f              The Form Feed character (ASCII code 12). Equivalent to \C-l and \014 .

\n              The Newline character (ASCII code 10). Equivalent to \C-j and \012 .

\r              The Carriage Return character (ASCII code 13). Equivalent to \C-m and \015 .

\s              The Space character (ASCII code 32).

\t              The TAB character (ASCII code 9). Equivalent to \C-i and \011 .

\unnnn          The Unicode codepoint nnnn , where each n is one hexadecimal digit. Leading zeros may not be dropped;
                all four digits are required in this form of the \u escape. Supported in Ruby 1.9 and later.

\u{hexdigits}   The Unicode codepoint(s) specified by hexdigits . See the description of this escape in the main text.
                Ruby 1.9 and later.

\v              The vertical tab character (ASCII code 11). Equivalent to \C-k and \013 .

\nnn            The byte nnn , where nnn is three octal digits between 000 and 377.

\nn             Same as \0nn , where nn is two octal digits between 00 and 77.

\n              Same as \00n , where n is an octal digit between 0 and 7.

\xnn            The byte nn , where nn is two hexadecimal digits between 00 and FF. (Both lowercase and uppercase
                letters are allowed as hexadecimal digits.)

\xn             Same as \x0n , where n is a hexadecimal digit between 0 and F (or f).

\cx             Shorthand for \C-x .

\C-x            The character whose character code is formed by zeroing the sixth and seventh bits of x , retaining the
                high-order bit and the five low bits. x can be any character, but this sequence is usually used to represent
                control characters Control-A through Control-Z (ASCII codes 1 through 26). Because of the layout of the
                ASCII table, you can use either lowercase or uppercase letters for x . Note that \cx is shorthand. x can be
                any single character or an escape other than \C \u , \x , or \nnn .

\M-x            The character whose character code is formed by setting the high bit of the code of x . This is used to
                represent “meta” characters, which are not technically part of the ASCII character set. x can be any single
                character or an escape other than \M \u , \x , or \nnn . \M can be combined with \C as in \M-\C-A .

\eol            A backslash before a line terminator escapes the terminator. Neither the backslash nor the terminator
                appear in the string.  
end
