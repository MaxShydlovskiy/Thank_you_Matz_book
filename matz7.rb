#!/usr/bin/ruby

$files      # A global variable
@data       # An instance variable
@@counter   # A class variable
empty?      # A Boolean-valued method or predicate
sort!       # An in-place alternative to the regular sort method
timeout=    # A method invoked by assignment

  Keywords:

__LINE__    __ENCODING__    __FILE__    BEGIN

  END        alias          and         begin

  break      case           class       def

  defined?    do            else        elsif

  end         ensure        false       for

  if          in            module      next

  nil         not           or          redo

  rescue      retry         return      self

  super       then          true        undef

  unless      until         when        while

  yield



  # These are methods that appear to be statements or keywords

  at_exit      catch        private   require  attr

include        proc         throw     attr_accessor lambda

protected      attr_reader  load      public
  
attr_writer    loop  raise

# These are commonly used global functions
Array         chomp           gsub         select 
Float         chop            iterator?    sleep
Integer       chop!           load         split
String        eval            open         sprintf
URI           exec            p            srand
abort         exit            print        sub 
autoload      exit!           printf       sub!
autoload?     fail            putc         syscall
binding       fork            puts         system
block_given?  format          rand         test 
callcc        getc            readline     trap
caller        gets            readlines    warn
chomp         gsub            scan

# These are commonly used object methods
allocate     freeze       kind_of?      superclass
clone        frozen?      method        taint
display      hash         methods       tainted?
dup          id           new           to_a
enm_for      inherited    nil?          to_enum
eql?         inspect      object_id     to_s
equal?       instance_of? respond_to?   untaint
extend       is_a?        send
