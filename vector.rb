#! usr/bin/env ruby

require './point.rb'

class Vector

	def initialize(delta_x, delta_y)
		@delta_x = delta_x.to_f
		@delta_y = delta_y.to_f
	end

	def get_delta_x
		return @delta_x
	end

	def get_delta_y
		return @delta_y
	end

	def magnitude
		return Math.sqrt(@delta_x ** 2 + @delta_y ** 2)
	end

	def deflect_x
		return Vector.new(@delta_x * -1, @delta_y)
	end

	def deflect_y
		return Vector.new(@delta_x, @delta_y * -1)
	end

	def plus(other_vector)
		return Vector.new(@delta_x + other_vector.get_delta_x, @delta_y + other_vector.get_delta_y)
	end

	def minus(other_vector)
		return self.plus(other_vector.deflect_y.deflect_x)
	end

	def scale(factor)
		return Vector.new(factor * @delta_x, factor * @delta_y)
	end

	def rescale(magnitude)
		if self.magnitude == 0
			return Vector.new(magnitude, 0)
		end
		new_factor = magnitude.to_f / self.magnitude.to_f

		return Vector.new(new_factor * @delta_x, new_factor * @delta_y)
	end

	def to_s
		puts "[#{@delta_x}, #{@delta_y}]"
	end

	def same_as?(other_vector)
		return @delta_x == other_vector.get_delta_x && @delta_y == other_vector.get_delta_y
	end
	

end
