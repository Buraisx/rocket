require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
	def setup
		options = {name: "bob", colour: "white", flying: true}
		@rocket = Rocket.new(options)
		@rocket2 = Rocket.new
	end
	def test_initialize_name
		name = @rocket.name
		assert_equal("bob", name)
	end

	def test_initialize_colour
		colour = @rocket.colour
		assert_equal("white", colour)
	end

	def test_initialize_flying
		flying = @rocket.flying?
		assert_equal(true, flying)
	end

	def test_initialize_random_name
		
		name = @rocket2.name
		random = @rocket2.prefixes.include?(name.split[0].downcase) && @rocket2.suffixes.include?(name.split[1].downcase)
		assert random
	end

	def test_initialize_random_colour
		colour = @rocket2.colour
		random = @rocket2.colour_list.include?(colour)
		assert random
	end

	def test_initialize_flying_noinput
		flying = @rocket2.flying?
		assert_equal(false, flying)
	end

	def test_name_setter
		
		@rocket2.name = "hihi"
		assert_equal(@rocket2.name, "hihi")

	end

	def test_new_colour_setter
	
		@rocket2.colour = "maroon"
		assert_equal(@rocket2.colour, "maroon")

	end
	def test_lift_off_true
		actual = @rocket.lift_off
		expect = false
		assert_equal(expect,actual)
	end

	def test_lift_off_false
		actual = @rocket2.lift_off
		expect = true
		assert_equal(expect,actual)
	end

	def test_status_flying
		expect = "Rocket #{@rocket.name} is flying through the sky!"
		actual = @rocket.status
		assert_equal(expect,actual)
	end
	def test_status_liftoff
		expect = "Rocket #{@rocket2.name} is ready for lift off!"
		actual = @rocket2.status
		assert_equal(expect,actual)
	end
end
