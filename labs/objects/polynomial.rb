#! usr/bin/env ruby

require_relative 'linked_list'

class Polynomial

	attr_accessor :list

	# Things in the LinkedList are not indexed from zero.

	def initialize
		@list = LinkedList.new
	end

	def to_string
		count = 0
		@list.each do |list_item|
			puts "#{list_item}x^#{count} +"
		end
	end

	def add_term(coefficient)
		# This method will add the coefficient at the end like is done in Java's add(E e) method
		# for the LinkedList class
		@list.add_end(Node.new(coefficient, nil, nil))
	end

	# Recursive evaluate method for evaluating the polynomial
	# from a starting index.
	def evaluate(x, starting_index)
		if starting_index == @list.size
			return 0
		else
			return @list.get_index(starting_index) + x * (evaluate(x, starting_index + 1))
		end
	end

	# Take the derivative of the polynomial
	def derivative
		derivative = Polynomial.new
		if @list.size == 0
			return 0
		else
			if @list.size == 1
				return derivative
			else
				index = 2
				iterations = @list.size - 1
				iterations.times do |this|
					derivative.add_term(@list.get_index(index) * index)
				end
				return derivative
			end
		end
	end

	# Evaluate the sum of adding two polynomials together
	def sum(other_polynomial)
		result = Polynomial.new
		if other_polynomial.list.size == 0
			return self
		else
			iterations = 0
			self_smaller = false
			if @list.size > other_polynomial.list.size
				iterations = @list.size
			else
				iterations = other_polynomial.list.size
				self_smaller = true
			end

			count = 0
			iterations.times do |this|
				if count <= other_polynomial.list.size 
					result.add_term(@list.get_index(count) + other_polynomial.list.get_index(count))
				else
					if self_smaller
						result.add_term(other_polynomial.list.get_index(count))
					else
						result.add_term(@list.get_index(count))
					end
				end
			end
		end
	end
	
	def same_as?(other_polynomial)

		if @list.size != other_polynomial.list.size
			return false
		end
		index = 1
		@list.size.times do |this|
			if @list.get_index(index) != other_polynomial.list.get_index(index)
				return false
			end
		end
		return true
	end
end

