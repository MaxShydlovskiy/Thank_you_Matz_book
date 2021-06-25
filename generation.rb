#!/usr/bin/ruby

=begin
/[Rr]uby/     # Matches "Ruby" or "ruby"

/\d{5}/       # Matches 5 consecutive digits

1..3          # All x where 1 <= x <= 3

1...3         # All x where 1 <= x < 3
=end
# Determine US generation name based on birth year
# Case expression test ranges with ===
generation = case birthyear
             when 1946..1963 "Baby Boomer" 
             when 1964..1976 "Generation X"
             when 1978..2000 "Generation Y"
# A method to ask the user to confirm something
def are_you_sure?       # Define a method. Note question mark!
  while true            # Loop untill we explicitly return
    print "Are you sure? [y/n]"   # Ask th user a question
    response = gets               # Get her answer
    case response                 # Begin case conditional
    when /^[yY]/                  # If response begins with y or Y
      return true                 # Return true from the method
    when /^[nN]/, /^$/            # If response begins with n, or is empty
      return false                # Return false
    end
  end
end
