# Author:: Georg Konwisser, gekonwi@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'

require_relative '../src/triangle'
require_relative '../src/point'

describe 'triangle' do
	it 'does not initialize without args' do
		proc {a = Triangle.new}.must_raise ArgumentError
	end

	it 'initializes with 3 points' do
		tri(1, 2, 3, 4, 5, 6).must_be_instance_of Triangle
	end

	it 'gives access to first point' do
		tri = tri(1, 2, 3, 4, 5, 6)
		point_must_equal(Point.new(1, 2), tri.p1)
	end

	it 'gives access to second point' do
		tri = tri(1, 2, 3, 4, 5, 6)
		point_must_equal(Point.new(3, 4), tri.p2)
	end

	it 'gives access to third point' do
		tri = tri(1, 2, 3, 4, 5, 6)
		point_must_equal(Point.new(5, 6), tri.p3)
	end

	it 'refuses changes' do
		proc {tri(1, 2, 3, 4, 5, 6).p1 = Point.new(9, 9)}.must_raise NoMethodError
	end

	it 'handles three equal points correctly' do
		tri(1, 2, 1, 2, 1, 2).area.must_be_close_to 0
	end

	it 'calculates area with negative coordinates' do
		# 7 * 5 / 2 = 17.5
		tri(-5, 0, 2, 0, 0, -5).area.must_be_close_to 17.5
	end

	def tri(x1, y1, x2, y2, x3, y3)
		p1, p2, p3 = Point.new(x1, y1), Point.new(x2, y2), Point.new(x3, y3)
		Triangle.new(p1, p2, p3)
	end

	def point_must_equal (p1, p2)
		p1.x.must_be_close_to p2.x
		p1.y.must_be_close_to p2.y
	end
end