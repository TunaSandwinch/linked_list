# frozen_string_literal: true

require_relative 'node'
# class for linked list
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def head_val
    head.value
  end

  def tail_val
    tail.value
  end

  def append(value)
    if head.nil? # list has no items
      @head = Node.new(value)
      @tail = @head
    elsif head == tail # list has one item
      @tail = Node.new(value, head)
      @head.next_node = @tail
    else
      @tail = tail.next_node = Node.new(value, tail)
    end
  end

  def prepend(value)
    if head.nil? # list has no items
      @head = Node.new(value)
      @tail = @head
    elsif head == tail # list has one item
      @head = Node.new(value, tail)
      @head.next_node = @tail
    else
      @head = Node.new(value, nil, head)
    end
  end

  def to_s
    list_items(head)
  end

  def list_items(current_node = head)
    return print "(#{current_node.value})-> nil " if current_node.next_node.nil?

    print "(#{current_node.value})-> "
    list_items(current_node.next_node)
  end

  def count(current_node = head)
    return 1 if current_node.next_node.nil?

    count(current_node.next_node) + 1
  end

  def at(index, current_node = head)
    return nil if (index + 1) > count || index.negative?
    return current_node.value if index.zero?

    at(index - 1, current_node.next_node)
  end

  def pop
    @tail = tail.prev_node
    tail.next_node = nil
  end

  def contains?(value, current_node = head)
    return true if value == current_node.value
    return false if current_node.next_node.nil?

    contains?(value, current_node.next_node)
  end

  def find(value, current_node = head)
    return 0 if current_node.value == value
    return nil if current_node.next_node.nil?

    result = find(value, current_node.next_node)
    if result.nil?
      nil
    else
      result + 1
    end
  end
end
