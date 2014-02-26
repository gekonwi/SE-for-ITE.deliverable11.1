# Author:: Georg Konwisser, gekonwi@brandeis.edu

require 'set'

# A scene zero or more shapes and methods to add, remove, and inspect the
# contained shapes.
class Scene

	def initialize
		@shapes = Set.new
	end

	# returns the number of all contained shapes
	def shape_count
		@shapes.size
	end

	# returns the accumulated area of all contained shapes (ignoring intersections)
	def total_area
		sum = 0
		@shapes.each {|s| sum += s.area}
		sum
	end

	# adds the shape to this scene if it is not already contained (ignores the call
	# otherwise)
	def add_shape(shape)
		@shapes.add shape
	end

	# removes the shape from the scene if it is contained (ignores the call
	# otherwise)
	def remove_shape(shape)
		@shapes.delete shape
	end
end