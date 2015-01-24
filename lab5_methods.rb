#! usr/bin/env ruby
# Implementation of lab5 for 131 in ruby.

class Lab5Methods

	# Have to define all of the methods with self in order to all them to be accesible to the test
	# suite.
	def self.sum_down_by_2(number)
		sum = 0
		if !number.is_a?(Integer)
			number = number.to_i
		end

		if number < 0
			return 0
		elsif number == 1
			return 1
		else

			while number >= 0
				sum += number
				number -= 2
			end
			return sum
		end
	end

	def self.harmonic_sum(number)
		if number < 1
			return 0.0
		else
			sum = 0.0
			count = 1
			number.times do
				sum += 1.0 / count
				count += 1
			end
			return sum
		end
	end

	def self.geometric_sum(number)
		if number < 0
			return 0.0
		else
			sum = 0.0
			count = 1
			number.times do
				sum += 1.0 / (2**count)
				count += 1
			end
			return sum
		end
	end
	
	def self.mult_pos(x, y)
		if x < 0 || y < 0
			return 0
		else
			sum = 0
			y.times do
				sum += x
			end
			return sum
		end
	end

	def self.mult(x, y)
		answer = mult_pos(x * -1, y * -1)
		if (x < 0 && y > 0) || (x > 0 && y < 0)
			return -1 * answer
		else
			return answer
		end
	end

	def self.expt(x, y)
		if y < 0 || x == 0
			return 0
		else
			answer = 1
			y.times do
				answer *= x
			end
			return answer
		end
	end
end



