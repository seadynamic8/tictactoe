class Board
	attr_reader :size, :grid

	def initialize(args)
		@size = args[:size]
		@grid = Array.new(size) { Array.new(size) { Cell.new } }
	end

	def display
		puts ""
		grid.each do |row|
			puts row.map {|cell| cell.value.empty? ? "_" : cell.value}.join(" ")
		end
		puts ""
	end

	def mark(mark, space)
		x_cord, y_cord = space
		self.grid[x_cord][y_cord].value = mark
	end

	def marked_with?(mark, space)
		x_cord, y_cord = space
		(grid[x_cord][y_cord].value == mark) ?	true : false
	end

	def marked?(space)
		x_cord, y_cord = space
		grid[x_cord][y_cord].value.empty? ? false : true
	end

	def get_space(x, y)
		grid[x][y].value
	end

	def rows
		grid
	end

	def cols
		grid.transpose
	end

end