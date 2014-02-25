# Author:: Georg Konwisser, gekonwi@brandeis.edu

class Point
	attr_reader :x, :y
	
	def initialize(x, y)
		@x, @y = x, y
	end
end