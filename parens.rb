# Create a method that returns true if the open and close parenthesis match in a proper way

def match? string
  return false unless string.scan(/\(/).size == string.scan(/\)/).size # First we check if there is the same number of "(" and ")"
  counter = 0 # we start the counter on zero. Every "(" will increase counter by 1, and every ")" will decrease couner by 1.
  string.each_char do |char|
    counter += 1 if char == "("
    counter -= 1 if char == ")"
    return false if counter == -1 # return false if the counter is negative at any time
  end
  true
end

puts match?('')                         == true
puts match?("((")                       == false
puts match?("()")                       == true
puts match?("(hello)")                  == true
puts match?("(hello))")                 == false
puts match?("(hello, how are(you))")    == true
