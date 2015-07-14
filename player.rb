class Player
	attr_reader :type

	def initialize(args)
		@type = args[:type]
	end

	def go(board)
		puts "Move (Player #{type}): "
		move = gets.chomp.split(" ")
		board.move(self, move)
	end
end