#! usr/bin/env ruby
require 'test/unit'
require './lab5_methods.rb'

class Lab5MethodsTest < Test::Unit::TestCase

	# Randomly generated number will be used by all test methods. 
	random = rand
	
	def test_sum_down_by_2
		# Test the zero case.
		if Lab5Methods.sum_down_by_2(0) != 0
			puts "sum_down_by_2 has an error when n = 0: Check to make sure that you cover for all cases n >=0"
			result = Lab5Methods.sum_down_by_2(0)
			puts "0 vs. your result --> #{result}"
		end
		
		assert_equal(0, Lab5Methods.sum_down_by_2(0))

		# Generate some random input
		100.times do |this|
			random_integer = rand(100)
			sum = 0
			sum_down_by_2_result = Lab5Methods.sum_down_by_2(random_integer)

			# Calculate the correct answer
			while random_integer > 0
				sum += random_integer
				random_integer -= 2
			end

			# Check for an error 
			if (sum != sum_down_by_2_result)
				puts "sum_down_by_2 error. There is some error with your arithmetic."
			end

			assert_equal(sum, sum_down_by_2_result)
			
		end
	end

	# Test the harmonic sum case
	def test_harmonic_sum

		# random input
		100.times do |this|
			random_integer = rand(100)
			harmonic_sum_result = Lab5Methods.harmonic_sum(random_integer)
			sum = 0

			# Calculate harmonic sum
			while random_integer > 0
				sum = sum + (1.0 / random_integer)
				random_integer -= 1
			end

			# Check for an error
			if (harmonic_sum_result + 0.01) < sum || (harmonic_sum_result - 0.01) > sum
				puts "harmonic_sum error. This is some error with your arithmetic."
			end

			assert_in_delta(sum, harmonic_sum_result, 0.01)
		end
	end

	# Test geometric sum
	def test_geometric_sum

		# Random input

		100.times do |this|
			random_integer = rand(100)
			geometric_sum_result = Lab5Methods.geometric_sum(random_integer)
			sum = 0

			while random_integer > 0
				sum += (1.0 / (2**random_integer))
				random_integer -= 1
			end

			# Error
			if (geometric_sum_result + 0.01) < sum || (geometric_sum_result - 0.01) > sum
				puts "Geometric sum error. This is some error with your arithemetic."
			end

			assert_in_delta(sum, geometric_sum_result, 0.01)
		end
	end

	# Check multiple
	def check_mult(j, k, calc_product)
		# Actual product
		actual_product = j * k

		# Error
		if actual_product != calc_product
			puts "Something wrong with your arithmetic."
		end

		assert_equal(actual_product, calc_product)
	end

	# Test the mult_pos
	def test_mult_pos

		100.times do |this|
			j = rand(1000) + 1
			k = rand(1000) + 1

			check_mult(j, k, Lab5Methods.mult_pos(j, k))
		end
	end

	def test_mult_any

		i = 0
		100.times do |this|
			j = rand((i + 1) * 2) - i
			k = rand(i + 1) # k >= 0

			check_mult(j, k, Lab5Methods.mult(j, k))
		end
	end

	# Test expt
	def test_expt

		i = 0
		100.times do |this|
			n = rand((i + 1) * 2) - i
			k = rand(i + 1)

			if n == 0 && k == 0
				next
			end

			expt_result = Lab5Methods.expt(n, k)
			expt = 1

			if k > 0
				expt = n
			end

			(k - 1).times do |this|
				expt = expt * n
			end

			# Error
			if expt != expt_result
				puts "There's an error"
			end

			assert_equal(expt, expt_result)

		end
	end
end
