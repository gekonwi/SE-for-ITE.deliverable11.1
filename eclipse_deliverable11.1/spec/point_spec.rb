# Author:: Georg Konwisser, gekonwi@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'

require_relative '../src/point'

describe 'point' do
	it 'does not initialize without args' do
		lambda {a = Point.new}.must_raise ArgumentError
	end

	it 'initializes with 2 args' do
		Point.new(1,2).must_be_instance_of Point
	end

	it 'gives access to x' do
		Point.new(1, 2).x.must_be_close_to 1
	end

	it 'gives access to y' do
		Point.new(1, 2).y.must_be_close_to 2
	end
end