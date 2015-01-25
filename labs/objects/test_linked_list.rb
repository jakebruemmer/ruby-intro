#! usr/bin/env ruby

require 'minitest/autorun'
require_relative 'linked_list'

class LinkedListTest < MiniTest::Test

	# method that makes Polynomials
	def make_linked_list(array_of_values)
		linked_list = LinkedList.new
		array_of_values.each do |v|
			new_node = Node.new v, nil, nil
			linked_list.add_end new_node
		end
		linked_list
	end

	def test_can_add_first
		array_of_value_lists = [ [], [1], [1, 2] ]

		array_of_value_lists.each do |vals|
			list = make_linked_list vals

			new_node = Node.new 42, nil, nil
			old_first = list.head.next_node

			list.add_first new_node

			assert_equal list.head.next_node, new_node
			assert_equal old_first.prev_node, new_node
		end
	end

	def test_can_add_end
		array_of_value_lists = [ [], [1], [1, 2] ]

		array_of_value_lists.each do |vals|
			list = make_linked_list vals

			new_node = Node.new 42, nil, nil
			old_last = list.tail.prev_node

			list.add_end new_node

			assert_equal list.tail.prev_node, new_node
			assert_equal old_last.next_node, new_node
		end
	end

	def test_can_get_index
		array_of_values = (1..5).to_a
		list = make_linked_list array_of_values

		array_of_values.each do |exp_index|
			assert_equal exp_index, list.get_index(exp_index).value
		end
	end
end
