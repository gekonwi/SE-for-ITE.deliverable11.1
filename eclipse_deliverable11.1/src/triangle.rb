# Author:: Georg Konwisser, gekonwi@brandeis.edu

class Triangle
	attr_reader :p1, :p2, :p3

	def initialize(p1, p2, p3)
		@p1, @p2, @p3 = p1, p2, p3
	end

	def area
		dividend = (@p1.x - @p3.x)*(@p2.y - @p1.y)
		dividend -= (@p1.x - @p2.x)*(@p3.y - @p1.y)
		(dividend / 2.0).abs
	end
end