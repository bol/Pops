class World
	def initialize(size)
		@heightMap = Array.new
		size.times {
				@heightMap << Array.new(size, 0)
		}
	end

	def print
		@heightMap.each { |row|
				puts row.to_s 
		}
	end

	attr_accessor :heightMap
end
