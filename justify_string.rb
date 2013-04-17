# Given a string (with whitespaces and words) and a number.
# Create a string of length num with an equal number of
# whitespaces between each word.
def justify(string, num)
  white = string.count(' ')
  list = string.split(' ')
  chars = string.split(' ').join('')
  common, extra = (num-chars.length).divmod(white)
  list.map! {|char| char+= (' '*common)}
  i = 0
  extra.times {list[0]+= ' '; i+=1}
  result = list.join('').rstrip
  # puts result.size
  return result
end

puts justify('aa bb cc', 20)


# This way of solving this problem was envisioned by Ryan Moser.
# The lessons to be learned by the way he solved this problem are:
# 1. Creation of Regular Expressions with String Interpolation
# 2. How to use backtracking in the second argument of a gsub or sub
#    when a regex is used as the first argumet of the same function
# 3. sub and gsub return nil if the obj (<str>) doesn't match the first
#    argument in the sub or gsub

def justify(str, width)
  whitespace = ' '
  while str.length < width
    spacing = Regexp.new("(\\w)#{whitespace}(\\w)")
    sub = str.sub!(spacing, "\\1 #{whitespace}\\2")
    whitespace << ' ' unless sub
  end
  # puts str.size
  str
end

puts justify('aa bb cc', 20)
# puts justify('aa b cc', 70)
# puts justify('asdfga bd c', 50)



