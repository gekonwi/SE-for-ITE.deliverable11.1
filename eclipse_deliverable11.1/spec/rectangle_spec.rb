# Author:: Georg Konwisser, gekonwi@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'

require_relative '../src/rectangle'
require_relative '../src/point'

describe 'rectangles' do
	it 'does not initialize without args' do
		lambda {a = Rectangle.new}.must_raise(ArgumentError)
	end

	it 'initializes with 2 points' do
		rect(1, 2, 3, 4).must_be_instance_of(Rectangle)
	end

	it 'gives access to min_x' do
		rect(1, 2, 3, 4).min_x.must_be_close_to 1
	end

	it 'gives access to max_x' do
		rect(1, 2, 3, 4).max_x.must_be_close_to 3
	end

	it 'gives access to min_y' do
		rect(1, 2, 3, 4).min_y.must_be_close_to 2
	end

	it 'gives access to max_y' do
		rect(1, 2, 3, 4).max_y.must_be_close_to 4
	end

	it 'handles two equal points correctly' do
		rect(1, 2, 1, 2).area.must_be_close_to 0
	end

	it 'calculates area with negative coordinates' do
		rect(-5, 2, -1, -3).area.must_be_close_to 20
	end

	def rect(x1, y1, x2, y2)
		p1, p2 = Point.new(x1, y1), Point.new(x2, y2)
		Rectangle.new(p1, p2)
	end
end