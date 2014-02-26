# Author:: Georg Konwisser, gekonwi@brandeis.edu

class Circle
	attr_reader :center, :radius
	
	def initialize(center, radius)
		raise ArgumentError, 'radius must be positive' if radius < 0
		@center, @radius = center, radius
	end
	
	def area
		Math::PI * radius * radius
	end
end