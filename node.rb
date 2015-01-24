#! usr/bin/env ruby
# Implements a node class that will be used in a linkedlist

class Node

	attr_accessor :value, :next_node, :prev_node

	def initialize(value, next_node, prev_node)
		@value = value.to_f
		@next_node = next_node
		@prev_node = prev_node
	end

	def same_as?(other_node)
		return other_node.get_value == @value
	end

	def has_next?
		if @next_node.nil?
			return false
		else
			return true
		end
	end

	def to_string
		puts "(#{value})"
	end
	
end
