# Create a method that returns true if the open and close parenthesis match in a proper way
require 'benchmark'
def match? string
  counter = 0 # we start the counter on zero. Every "(" will increase counter by 1, and every ")" will decrease couner by 1.
  string.each_char do |char|
    counter += 1 if char == "("
    counter -= 1 if char == ")"
    return false if counter == -1 # return false if the counter is negative at any time
  end
  counter == 0
end

# puts match?('')                         == true
# puts match?("((")                       == false
# puts match?("))((")                     == false
# puts match?("()")                       == true
# puts match?("(hello)")                  == true
# puts match?("(hello))")                 == false
# puts match?("(hello, how are(you))")    == true

def match2? string
  translation = { "(" => 1, ")" => -1 }
  string.each_char.inject(0) do |counter, char|
    return false if counter == -1
    counter += translation.fetch(char, 0)
  end == 0
end

long_ass_matched_string = ("("*1000) + (")"*1000)
long_ass_unmatched_string = ("("*1000) + (")"*1001)

Benchmark.bmbm do |x|
  x.report('omar'){10000.times{match?(long_ass_unmatched_string)}}
  x.report('zee'){10000.times{match2?(long_ass_unmatched_string)}}
  x.report('omar'){10000.times{match?(long_ass_matched_string)}}
  x.report('zee'){10000.times{match?(long_ass_matched_string)}}
end
