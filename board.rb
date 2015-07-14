class Board
	attr_reader :size, :board

	def initialize(args)
		@size = args[:size]
		@board = [] 
		size.times do |row|
			board[row] = []
			size.times do |col|
				board[row][col] = 0
			end
		end
	end

	def display
		size.times do |row|
			size.times do |col|
				print "#{board[row][col]}"
				if col == size - 1
					print "\n"
				else
					print " "
				end
			end
		end
	end

	def move(player, space)
		type = player.type
		space = spacify(space)
		self.board[space.x_cord][space.y_cord] = type
	end

	Space = Struct.new(:x_cord, :y_cord)
	def spacify(space)
		Space.new(space[0], space[1])
	end
end