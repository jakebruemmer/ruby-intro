#! usr/bin/env ruby
require_relative 'node'

# LinkedList implmenetation to be used in polynomial.rb
# Implementation will use head/tail sentinels

class LinkedList

	attr_accessor :head, :tail, :size

	def initialize
		@head = Node.new(0.0, nil, nil)
		@tail = Node.new(0.0, nil, nil)
		@size = 0

		@head.next_node = @tail
		@tail.prev_node = @head
	end

	def add_first(node_to_add)
		node_to_add.insert_between @head, @head.next_node

		@size += 1
	end

	# Similar operation as 'add_first', but implements according to Java's LinkedList add(E e) method.
	# The add(E e) method adds an element at the end of the LinkedList.
	def add_end(node_to_add)
		node_to_add.insert_between @tail.prev_node, @tail

		@size += 1
	end

	def get_index(index)
		index = index.to_i
		return nil if index > @size

		node_found = @head
		index.times { node_found = node_found.next_node }
		node_found
	end
end
