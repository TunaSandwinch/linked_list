# frozen_string_literal: true

class Node # rubocop:disable Style/Documentation
  attr_accessor :value, :next_node, :prev_node

  def initialize(value, prev_node = nil, next_node = nil)
    @value = value
    @prev_node = prev_node
    @next_node = next_node
  end
end
