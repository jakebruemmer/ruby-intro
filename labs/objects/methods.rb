#! usr/bin/env ruby

class Methods

	# Implement the functions that are described on the lab page
	def f(x)
		if x <= 100
			return f(f(x + 11))
		else
			return x - 10
		end
	end

	def g(x, y)
		if x == 0
			return y + 1
		end
		if x > 0 && y == 0
			return g(x - 1, 1)
		end
		if x > 0 && y > 0
			return g(x - 1, g(x, y - 1))
		end

		# This shouldn't happen
		return -1
	end
end

# run the Methods
if __FILE__ == $0
	methods = Methods.new
	puts methods.f(99)
	puts methods.f(81)
	puts methods.g(2, 5)
	puts methods.g(1, 2)
end
