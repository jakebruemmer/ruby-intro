#! usr/bin/env ruby

require 'test/unit'
require './vector'
require './point'

class VectorAndPointTest < Test::Unit::TestCase

	# Test the initialization of the Vector class.
	def test_initialize
		vector = Vector.new(5.0, 3.0)
		assert_equal(5.0, vector.get_delta_x)
		assert_equal(3.0, vector.get_delta_y)

		error_message_1 = "Either your get_delta_x method isn't doing it's job or you're not setting"
		error_message_1 += " your instance variables properly."

		error_message_2 = "Either your get_delta_y method isn't doing it's job or you're not setting"
		error_message_2 += " your instance variables properly"

		20.times do |this|
			a = rand(5000).to_f
			b = rand(5000).to_f
			new_vector = Vector.new(a, b)
			assert_equal(a, new_vector.get_delta_x, error_message_1)
			assert_equal(b, new_vector.get_delta_y, error_message_2)
		end
	end

	# Test the arithmetic of the calculations
	def test_arithmetic
		20.times do |this|
			a = rand(5000).to_f
			b = rand(5000).to_f
			v = Vector.new(a, b)
			v_plus_v = v.plus(v)
			v_minus_v = v.minus(Vector.new(a / 2.0, b / 2.0))

			# Plus and minus methods need to return new objects
			compare_vectors(Vector.new(a, b), v)

			# Test out the plus and minus methods
			compare_vectors(Vector.new(a * 2.0, b * 2.0), v_plus_v)
			compare_vectors(Vector.new(a / 2.0, b / 2.0), v_minus_v)

			# Test out the resulting doubles from doing the vector operations
			assert_in_delta(a * 2.0, v_plus_v.get_delta_x)
			assert_in_delta(b * 2.0, v_plus_v.get_delta_y)
			assert_in_delta(a / 2.0, v_minus_v.get_delta_x)
			assert_in_delta(b / 2.0, v_minus_v.get_delta_y)
		end
	end

	def compare_vectors(v1, v2)
		assert_in_delta(v1.get_delta_x, v2.get_delta_x, 0.01)
		assert_in_delta(v1.get_delta_y, v2.get_delta_y, 0.01)
	end

	def test_scale_and_deflect
		20.times do |this|
			a = rand(5000).to_f
			b = rand(5000).to_f
			v = Vector.new(a, b)
			bigger_v = v.scale(1.5)
			smaller_v = v.scale(0.75)

			# Test the components of the new vector from the scaling
			assert_in_delta(a * 1.5, bigger_v.get_delta_x, 0.01)
			assert_in_delta(b * 1.5, bigger_v.get_delta_y, 0.01)
			assert_in_delta(a * 0.75, smaller_v.get_delta_x, 0.01)
			assert_in_delta(b * 0.75, smaller_v.get_delta_y, 0.01)

			# more work to do
			assert_in_delta(-b * 0.75, smaller_v.deflect_y.get_delta_y, 0.01)
			assert_in_delta(b * 0.75, smaller_v.deflect_x.get_delta_y, 0.01)
			assert_in_delta(-a * 0.75, smaller_v.deflect_x.get_delta_x, 0.01)
		end
	end

	def test_rescale
		20.times do |this|
			a = rand(5000)
			b = rand(5000)
			vector = Vector.new(a, b)
			assert_equal(Math.sqrt(a ** 2 + b ** 2), vector.magnitude)
			rescale_val_a = (a.to_f * 10.0) / (Math.sqrt(a ** 2 + b ** 2))
			assert_in_delta(rescale_val_a, vector.rescale(10).get_delta_x, 0.01)
			rescale_val_b = (b.to_f * 10.0) / (Math.sqrt(a ** 2 + b ** 2))
			assert_in_delta(rescale_val_b, vector.rescale(10).get_delta_y, 0.01)
		end
	end

	def test_special_cases
		zero_vector = Vector.new(0, 0)
		assert_equal(0, zero_vector.magnitude)

		20.times do |this|
			a = rand(5000).to_f
			rescaled_vector = zero_vector.rescale(a)
			assert_in_delta(a, rescaled_vector.magnitude, 0.01)
			assert_in_delta(a, rescaled_vector.get_delta_x, 0.01)
			assert_in_delta(0, rescaled_vector.get_delta_y, 0.01)
		end
	end

	def test_point_init
		20.times do |this|
			a = rand(5000).to_f
			b = rand(5000).to_f
			point = Point.new(a, b)
			assert_in_delta(a, point.get_x, 0.01)
			assert_in_delta(b, point.get_y, 0.01)
		end
	end

	def test_point_plus
		20.times do |this|
			a = rand(5000).to_f
			b = rand(5000).to_f
			c = rand(5000).to_f
			d = rand(5000.to_f)
			point = Point.new(a, b)
			vector = Vector.new(c, d)
			point_2 = point.plus(vector)
			assert_in_delta(a + c, point_2.get_x, 0.01)
			assert_in_delta(b + d, point_2.get_y, 0.01)
		end
	end

	def test_point_minus
		20.times do |this|
			a = rand(5000).to_f
			b = rand(5000).to_f
			c = rand(5000).to_f
			d = rand(5000).to_f
			point = Point.new(a, b)
			point_2 = Point.new(c, d)
			vector = point.minus(vector)
			assert_in_delta(a - c, vector.get_delta_x, 0.01)
			assert_in_delta(b - d, vector.get_delta_y, 0.01)
		end
	end

	def test_point_distance
		20.times do |this|
			a = rand(5000).to_f
			b = rand(5000).to_f
			c = rand(5000).to_f
			d = rand(5000).to_f
			point = Point.new(a, b)
			point_2 = Point.new(c, d)
			assert_in_delta(Math.sqrt((a - c) ** 2 + (b - d) ** 2), point.distance(point_2))
		end
	end

end