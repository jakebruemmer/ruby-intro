#! usr/bin/env ruby

# Beer class from cse-131

class Beer

	# Recursive method that prints out the song 'bottles of beer on the wall'
	def bottles_of_beer(beer_bottles)
		if beer_bottles > 0
			puts "#{beer_bottles} bottles of beer on the wall!"
			puts "#{beer_bottles} bottles of beer!"
			puts "You take one down, pass it around..."
			puts "#{beer_bottles} bottles of beer on the wall!"
			return bottles_of_beer(beer_bottles - 1)
		else
			return ""
		end
	end

	def quiz_method(a, b, c)
		return a + b + c
	end

	# Check if a number is positive
	def is_positive?(n)
		n > 0
	end

	# Exponent method written using recursion
	def expt(base, power)
		if power == 0
			return 1
		elsif power == 1
			return base
		else
			return base * expt(base, power - 1)
		end
	end

end

# Test the code
if __FILE__ == $0
	beer = Beer.new
	beer.bottles_of_beer(5)
	puts beer.expt(3, 3)
end