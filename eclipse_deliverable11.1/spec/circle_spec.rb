# Author:: Georg Konwisser, gekonwi@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'

require_relative '../src/circle'
require_relative '../src/point'

describe 'circle' do
	it 'does not initialize without args' do
		lambda {a = Circle.new}.must_raise ArgumentError
	end

	it 'initializes with point and radius' do
		circle(1, 2, 3).must_be_instance_of Circle
	end

	it 'initializes with negative point coordinates and positive radius' do
		circle(1, -2, 3).must_be_instance_of Circle
	end

	it 'does not initialize with negative radius' do
		circle(1, -2, -3).must_raise ArgumentError
	end

	it 'handles a zero radius correctly' do
		circle(1, 2, 0).area.must_be_close_to 0
	end

	it 'calculates area with negative coordinates' do
		exp = Math::PI * 4
		circle(-5, 0, 2).area.must_be_close_to exp
	end

	def circle(x, y, radius)
		Circle.new(Point.new(x, y), radius)
	end
end