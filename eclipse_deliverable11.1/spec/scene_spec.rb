# Author:: Georg Konwisser, gekonwi@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'

require_relative '../src/scene'
require_relative '../src/point'
require_relative '../src/rectangle'
require_relative '../src/triangle'
require_relative '../src/circle'

class ShapeMock
	attr_reader :area

	def initialize(area)
		@area = area
	end
end

describe 'scene' do
	it 'does initialize without args' do
		Scene.new.must_be_instance_of Scene
	end

	it 'counts added shapes correctly' do
		scene = Scene.new
		p1_2, p3_4 = Point.new(1, 2), Point.new(3, 4)

		5.times {scene.add_shape Rectangle.new(p1_2, p3_4)}

		scene.shape_count.must_equal 5
	end

	it 'counts different added shapes correctly' do
		scene = Scene.new
		p1_2, p3_4 = Point.new(1, 2), Point.new(3, 4)

		5.times {scene.add_shape Rectangle.new(p1_2, p3_4)}
		scene.add_shape Circle.new(p1_2, 3)

		scene.shape_count.must_equal 6
	end

	it 'counts shapes correctly after removal' do
		scene = Scene.new
		p1_2, p3_4 = Point.new(1, 2), Point.new(3, 4)

		5.times {scene.add_shape Rectangle.new(p1_2, p3_4)}

		circle = Circle.new(p1_2, 3)
		rect = Rectangle.new(p3_4, p1_2)
		scene.add_shape circle
		scene.add_shape rect

		scene.remove_shape circle
		scene.remove_shape rect

		scene.shape_count.must_equal 5
	end

	it 'adds the same shape only once' do
		scene = Scene.new
		p1_2, p3_4 = Point.new(1, 2), Point.new(3, 4)

		rect = Rectangle.new(p3_4, p1_2)
		5.times {scene.add_shape rect}

		scene.shape_count.must_equal 1
	end

	it 'ignores the request to remove a not contained shape' do
		scene = Scene.new
		p1_2, p3_4 = Point.new(1, 2), Point.new(3, 4)

		5.times {scene.add_shape Rectangle.new(p1_2, p3_4)}

		rect = Rectangle.new(p1_2, p3_4)
		scene.remove_shape rect

		scene.shape_count.must_equal 5
	end

	it 'ignores repeated removal of the same shape' do
		scene = Scene.new
		p1_2, p3_4 = Point.new(1, 2), Point.new(3, 4)

		5.times {scene.add_shape Rectangle.new(p1_2, p3_4)}

		rect = Rectangle.new(p1_2, p3_4)
		scene.add_shape rect

		5.times {scene.remove_shape rect}

		scene.shape_count.must_equal 5
	end

	it 'adds up all added areas correctly' do
		scene = Scene.new
		scene.add_shape ShapeMock.new(1)
		scene.add_shape ShapeMock.new(5)
		scene.add_shape ShapeMock.new(10)

		scene.total_area.must_equal 16
	end

	it 'adds up all areas correctly after shape removal' do
		scene = Scene.new
		shape1 = ShapeMock.new(1)
		scene.add_shape shape1
		scene.add_shape ShapeMock.new(5)
		scene.add_shape ShapeMock.new(10)

		scene.remove_shape shape1

		scene.total_area.must_equal 15
	end

	it 'returns a total area of 0 if no shapes were added' do
		scene = Scene.new

		scene.total_area.must_equal 0
	end
end