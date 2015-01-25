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
		@head.prev_node = nil
		@tail.prev_node = @head
		@tail.next_node = nil
	end

	def add_first(node_to_add)
		# Node next should be what was previously the head's next
		node_to_add.next_node = @head.next_node
		# Node added should now be previous node of head's former next
		@head.next_node.prev_node = node_to_add
		# Next of head should be the node added
		@head.next_node = node_to_add
		# Previous node of added node should be the head
		node_to_add.prev_node = @head	

		@size += 1
	end

	# Similar operation as 'add_first', but implements according to Java's LinkedList add(E e) method.
	# The add(E e) method adds an element at the end of the LinkedList.
	def add_end(node_to_add)
		# Tail's former prev should have it's next set to the node to be added
		@tail.prev_node.next_node = node_to_add
		# Tail's previous node now needs to be the previous node of the @tail
		node_to_add.prev_node = @tail.prev_node
		# Node that get's added needs to have a next of tail
		node_to_add.next_node = @tail 
		# Tail's previous node needs to be the node that was added
		@tail.prev_node = node_to_add

		@size += 1
	end

	def get_index(index)
		index = index.to_i
		if index > @size
			return nil
		else
			count = 1
			current_node = @head.next_node
			while index != count
				current_node = current_node.next_node
				count += 1
			end
			return current_node
		end
	end
	


end




