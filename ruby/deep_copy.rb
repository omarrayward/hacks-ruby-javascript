# Create a method that creates a deep copy.
# In a shallow copy only fundamental dataTypes (fixnum and symbol)
# get copied in new objects. Everything else is copied as a reference
# to the object.

def deep_copy_1(value)
  Marshal.load(Marshal.dump(value))
end

def deep_copy_2(value)
  if value.is_a?(Hash)
    result = value.dup
    value.each{|k, v| result[k] = deep_copy_2(v)}
    result
  elsif value.is_a?(Array)
    result = []
    value.each{|v| result << deep_copy_2(v)}
    result
  else
    value
  end
end

# Example 1. Copies done with either dup and clone method
# only create shallow copies.

puts "Example with clone and dup method"
c = [1,2,3,4,[3,4,4,[45]]]
d = c.dup
e = c.clone
puts d == c
c[-1][-1]=32
puts d == c
puts e == c



# Example 2. Copies done with Marshal dump and load.
# Marshal module is a Ruby library that converts objects
# in strams of byts. So by using the Marshal module, we first
# convert the objects into bytes and viceversa
puts "Example with Marshal"
a = [1,2,3,4,[3,4,4,[45]]]
b = deep_copy_1(a)
puts a == b
a[-1][-1]=32
puts a == b



# Example 3. Method that creates deep copies using the dup
# method
puts "Example with method created with dup"
a = [1,2,3,4,[3,4,4,[45]]]
b = deep_copy_2(a)
puts a == b
a[-1][-1]=32
puts a == b



