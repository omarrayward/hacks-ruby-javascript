# Given a collection of sorted integers, find the position of the goal
# in the collection in log n time
def binary_search(goal, collection)
  bottom, top = 0, collection.length
  mid_point = top/2
  while true
    return mid_point if goal == collection[mid_point]
    return -1 if mid_point == top || mid_point == bottom
    if goal < collection[mid_point]
      top = mid_point
      mid_point = (bottom+top)/2
    else
      bottom, top = mid_point, top
      mid_point = (bottom+top)/2
    end
  end



end

list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts binary_search(2, list1) == 1
puts binary_search(6, list1) == 5
puts binary_search(9, list1) == 8
puts binary_search(10, list1) == 9
