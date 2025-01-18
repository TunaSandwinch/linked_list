require_relative 'node.rb'
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if head == nil
      @head = Node.new(value)
      @tail = @head
    elsif head == tail
      @tail = Node.new(value)
      @head.next_node = @tail
    else
      @tail = tail.next_node = Node.new(value)
    end
  end

  def to_s
    current_node = head
    value = ''
    while current_node.next_node 
      value.concat("(#{current_node.value})-> ")
      current_node = current_node.next_node
    end
    puts value.concat("(#{current_node.value})-> nil")
  end

  # def traverse(current_node)
  #   return current_node.value if current_node.next_node == nil
  #   puts current_node.value
  #   traverse(current_node.next_node)
  # end
end

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
list.to_s
# puts list.tail.next_node