# Given a collection of sorted and shifted elements, find
# the minimum element in the collection in log n time

list3 = [ 1, 2, 3, 4, 5, 6, 7, 9, 10]
list4 = [ 11, 22, 33, 44, 5, 6, 7, 9, 10]
list5 = [ 111, 3230, 3904, 4900, 5000, 60, 70, 90, 100]
list6 = [ 2, 3, 4, 5, 6, 7, 9, 10, 1]


def find_min(collection)
  return collection[0] if collection[0]<collection[-1]
  return collection[-1] if collection[-2]>collection[-1]
  mid_point = collection.size/2
  return collection[mid_point] if (collection[mid_point] < collection[mid_point-1])
  left, right = collection[0..mid_point-1], collection[mid_point..-1]
  if left[-1] > left[0]
    find_min(right)
  else
    find_min(left)
  end
end

puts find_min(list3)
puts find_min(list4)
puts find_min(list5)
puts find_min(list6)
