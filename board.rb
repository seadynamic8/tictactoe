class Board
	attr_reader :size, :board

	def initialize(args)
		@size = args[:size]
		@board = Array.new(size) { Array.new(size, 0) }
	end

	def display
		size.times do |row|
			size.times do |col|
				print "#{board[row][col]} "
			end
			print "\n"
		end
	end

	def mark(mark, space)
		x_cord, y_cord = space
		self.board[x_cord][y_cord] = mark
	end

	def marked?(mark, space)
		x_cord, y_cord = space
		(board[x_cord][y_cord] == mark) ?	true : false
	end

end