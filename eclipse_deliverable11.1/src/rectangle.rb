# Author:: Georg Konwisser, gekonwi@brandeis.edu

class Rectangle
	attr_reader :min_x, :max_x, :min_y, :max_y

	# creates a new Rectangle object using the two provided points. The line from
	# _p1_ to _p2_ is a diagonal of the rectangle.
	def initialize(p1, p2)
		@min_x = (p1.x < p2.x ? p1.x : p2.x)
		@max_x = (p1.x > p2.x ? p1.x : p2.x)
		@min_y = (p1.y < p2.y ? p1.y : p2.y)
		@max_y = (p1.y > p2.y ? p1.y : p2.y)
	end
	
	def area
		(@max_x - @min_x) * (@max_y - @min_y)
	end
end