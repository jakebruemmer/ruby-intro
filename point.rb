#! usr/bin/env ruby
require './vector.rb'

class Point

	def initialize(x, y)
		@x_coord = x.to_f
		@y_coord = y.to_f
	end

	def get_x
		return @x_coord
	end

	def get_y
		return @y_coord
	end

	# Define a to string method
	
	def to_s
		puts "(#{@x_coord}, #{@y_coord})"
	end

	def plus(other_vector)
		return Point.new(@x_coord + other_vector.get_delta_x, @y_coord + other_vector.get_delta_y)
	end

	def minus(other_point)
		return Vector.new(@x_coord - other_point.get_x, @y_coord - other_point.get_y)
	end

	def distance(other_point)
		return self.minus(other_point).magnitude
	end

end
