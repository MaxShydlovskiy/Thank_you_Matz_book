#!/usr/bin/ruby

File.open("data.txt") do |f|  # Open named file and pass stream to block
  line = f.readline           # Use the stream to read from the file
  end                         # Stream automatically closed at block end
 
  t = Thread.new do           # Run this block in a new thread
  File.read("data.txt")       # Read a file in the background
  end                         # File contents available as thread value

1 + 2                     # => 3: addition

1 * 2                     # => 2: multiplication

1 + 2 == 3                # => true: == tests equality

2 ** 1024                 # 2 to the power 1024: Ruby has arbitrary size ints

"Ruby" + " rocks!"        # => "Ruby rocks!": string concatenation

"Ruby! " * 3              # => "Ruby! Ruby! Ruby! ": string repetition

"%d %s" % [3, "rubies"]   # => "3 Rubies": Python-style, printf formatting

max = x > y ? x : y       # The conditional operator