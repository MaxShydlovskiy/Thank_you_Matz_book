#!/usr/bin/ruby

=begin
This module defines a Sudoku::Puzzle class to represent a 9x9
Sudoku puzzle and also defines exception classes raised for
invalid input and over-constrained puzzles. This module also defines
the method Sudoku.solve to solve a puzzle. The solve method uses
the Sudoku.scan method, which is also defined here.
Use this module to solve Sudoku puzzles with code like this:

require 'sudoku'
puts Sudoku.solve(Sudoku::Puzzle.new(ARGF.readlines))
=end
module Sudoku
  The Sudoku::Puzzle class represents the state of a 9x9 Sudoku puzzle.
#
# Some definitions and terminology used in this implementation:
#
# - Each element of a puzzle is called a "cell".
# - Rows and columns are numbered from 0 to 8, and the coordinates [0,0]
#refer to the cell in the upper-left corner of the puzzle.
# - The nine 3x3 subgrids are known as "boxes" and are also numbered from
#0 to 8, ordered from left to right and top to bottom. The box in
#the upper-left is box 0. The box in the upper-right is box 2. The
#box in the middle is box 4. The box in the lower-right is box 8.
# 
# Create a new puzzle with Sudoku::Puzzle.new, specifying the initial
# state as a string or as an array of strings. The string(s) should use
# the characters 1 through 9 for the given values, and '.' for cells
# whose value is unspecified. Whitespace in the input is ignored.

# Read and write access to individual cells of the puzzle is through the
# [] and []= operators, which expect two-dimensional [row,column] indexing.
# These methods use numbers (not characters) 0 to 9 for cell contents.
# 0 represents an unknown value.
#
# The has_duplicates? predicate returns true if the puzzle is invalid
# because any row, column, or box includes the same digit twice.
#
# The each_unknown method is an iterator that loops through the cells of
# the puzzle and invokes the associated block once for each cell whose
# value is unknown.
#
# The possible method returns an array of integers in the range 1..9.
# The elements of the array are the only values allowed in the specified
# cell. If this array is empty, then the puzzle is over-specified and
# cannot be solved. If the array has only one element, then that element
# must be the value for that cell of the puzzle.
class Puzzle
# These constants are used for translating between the external
# string representation of a puzzle and the internal representation.
ASCII = ".123456789"
BIN = "\000\001\002\003\004\005\006\007\010\011"
# This is the initialization method for the class. It is automatically
# invoked on new Puzzle instances created with Puzzle.new. Pass the input
# puzzle as an array of lines or as a single string. Use ASCII digits 1
# to 9 and use the '.' character for unknown cells. Whitespace,
# including newlines, will be stripped.
  def initialize(lines)
    if (lines.respond_to? :join)   # If argument looks like an array of lines
      s = lines.join               # Then join them into a single string
    else                           # Otherwise, assume we have a string
      s = lines.dup                # And make a privat copy of it
    end

    # Remove whitespace (including newlines) from the data
    # The '!' in gsub! indicates that this is a mutator method that
    # alters the string directly rather than making a copy.
    s.gsub!(/\s/, "") # /\s/ is a Regexp that matches any whitespace
    # Raise an exception if the input is the wrong size.
    # Note that we use unless instead of if, and use it in modifier form.
    raise Invalid, "Grid is the wrong size" unless s.size == 81
    # Check for invalid characters, and save the location of the first.
    # Note that we assign and test the value assigned at the same time.
    if i = s.index(/[^123456789\.]/)
      # Include the invalid character in the error message.
      # Note the Ruby expression inside #{} in string literal.
      raise Invalid, "Illegal character #{s[i,1]} in puzzle"
    end

    # The following two lines convert our string of ASCII characters
    # to an array of integers, using two powerful String methods.
    # The resulting array is stored in the instance variable @grid
    # The number 0 is used to represent an unknown value.
    s.tr!(ASCII, BIN)         # Translate ASCII characters into bytes
    @grid = s.unpack('c*')    # Now unpack the bytes into an array of numbers

    # Make sure that the rows, columns, and boxes have no duplicates.
    raise Invalid, "Illegal character #{s[i,1]} in puzzle"

    # Return the state of the puzzle as a string of 9 lines with 9
    # characters (plus newline) each.
    def to_s
      # This method is implemented with a single line of Ruby magic that
      # reverses the steps in the initialize() method. Writing dense code
      # like this is probably not good coding style, but it demonstrates
      # the power and expressiveness of the language.
      #
      # Broken down, the line below works like this:
      # (0..8).collect invokes the code in curly braces 9 times--once
      # for each row--and collects the return value of that code into an
      # array. The code in curly braces takes a subarray of the grid
      # representing a single row and packs its numbers into a string.
      # The join() method joins the elements of the array into a single
      # string with newlines between them. Finally, the tr() method
      # translates the binary string representation into ASCII digits.
      (0..8)collect{|r| @grid[r*9,9].pack('c9')}.join("\n").tr(BIN,ASCII)
    end

    # Return a duplicate of this Puzzle object.
    # This method overrides Object.dup to copy the @grid array.
    def dup
      copy = super            # Make a shallow copy by calling Object.dup
      @grid =@grid.dup        # Make a new copy of the internal data
      copy                    # Return the copied object
    end

    # We override the array access operator to allow access to the
    # individual cells of a puzzle. Puzzles are two-dimensional,
    # and must be indexed with row and column coordinates.
