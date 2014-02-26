# Author:: Georg Konwisser, gekonwi@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'

require_relative '../src/point'

describe 'point' do
	it 'does not initialize without args' do
		proc {a = Point.new}.must_raise ArgumentError
	end

	it 'initializes with 2 args' do
		Point.new(1,2).must_be_instance_of Point
	end

	it 'gives access to x' do
		Point.new(1, 2).x.must_equal 1
	end

	it 'gives access to y' do
		Point.new(1, 2).y.must_equal 2
	end

	it 'refuses changes' do
		proc {Point.new(1, 2).x = 5}.must_raise NoMethodError
	end

end