# shuffle the elements in an array without using the method shuffle

def shuffle(arr)
  last_element = arr.length-1
  arr.each_with_index do |element, index|
    rand_elem = rand(index..last_element)
    arr[index], arr[rand_elem] = arr[rand_elem], arr[index]
  end
  arr
end


p shuffle([1,2,3,4,5,6,7,8,9,0])
p shuffle([1,2,3,4,5,6,7,8,9,0])
p shuffle([1,2,3,4,5,6,7,8,9,0])
p shuffle([1,2,3,4,5,6,7,8,9,0])
