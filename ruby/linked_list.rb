# Implement a linked list in Ruby. This linked list, needs to be able to
# answer to adding an element, displaying the linked list, finding an
# element with a certain value, inserting elements in certain places,
# and shifting (getting rid of the first element in the list)

class Node
  attr_reader   :value
  attr_accessor :pointer
  def initialize (value)
    @value = value
    @pointer = nil
  end

  def to_s
    puts "#{@value} + #{@pointer}"
  end

end

class Linked_list
  attr_accessor :head
  def initialize(val)
    @head = Node.new(val)
  end

  def push(val)
    # add an element to the linked list
    current = @head
    while !current.pointer.nil?
      current = current.pointer
    end
    current.pointer = Node.new(val)
    self
  end

  def display
    # pretty print the linked list
    if @head.nil?
      puts "No linked list"
      return
    end
    current = @head
    full_list = []
    while current.pointer != nil
      full_list += [current.value.to_s]
      current = current.pointer
    end
    full_list += [current.value.to_s]
    puts full_list.join("->")
  end

  def find(data)
    # find the node with value == data
    current = @head
    while current.value != data && current.pointer != nil
      current = current.pointer
    end
    return current.value if current.value == data
    puts 'Sorry, that value is not in our linked list'
  end

  def insert(value, before_node)
    # insert a node with value == value before the node with value == before_node
    new_node = Node.new(value)
    current = @head
    while current.pointer.value != before_node
      current = current.pointer
    end
    current.pointer, new_node.pointer = new_node, current.pointer
    self
  end

  def shift
    # take head off list, reassign head
    @head = @head.pointer
  end



end

new_list = Linked_list.new(12)
new_list.push(11)
new_list.display
new_list.push(15)
new_list.display
new_list.find(110)
new_list.display

new_list.insert(23, 11)
new_list.display
