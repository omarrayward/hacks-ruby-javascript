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
  puts result.size
  return result.inspect
end




a= 'a a aa a bb'
puts justify(a, 50)

