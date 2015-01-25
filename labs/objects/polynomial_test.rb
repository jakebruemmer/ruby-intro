#! usr/bin/env ruby

require 'test/unit'
require_relative 'polynomial'

class PolynomialTest < Test::Unit::TestCase

	# method that makes Polynomials
	def make_polynomial(array_of_floats)
		polynomial = Polynomial.new
		array_of_floats.each do |i|
			polynomial.add_term(i)
		end
		return polynomial
	end

	def test_sum
		sum = make_polynomial([4.0, 6.0, 7.0, -9.0])
		p1 = make_polynomial([2.0, 3.0, 4.0, 1.0])
		p2 = make_polynomial([2.0, 3.0, 3.0, -10.0])
		empty = make_polynomial([])
		assert(p1.sum(p2).same_as?(sum))
		assert(empty.plus(empty).same_as?(empty))
	end
end
