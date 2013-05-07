# 3 Challenges in 1:
# * Implement map using only each
# * Implement inject using only each
# * Implement map using inject

class Array
  def map!
    new_array = []
    self.each do |element|
      new_array << yield(element)
    end
    new_array
  end

  def inject(memo= 0)
    self.each do |element|
      memo = yield(memo, element)
    end
    memo
  end

  def map2!
    memo = []
    self.inject(memo) do |memo, element|
      memo << yield(element)
    end
    memo
  end

end

p [1,2,3].map!{|e| e*2}
p [1,2,3].map2!{|e| e*2}
p [1,2,3].inject{|memo, e| memo+e}
