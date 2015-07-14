class Player
	attr_reader :type

	def initialize(args)
		@type = args[:type]
	end

	def go(board)
		board.move(self, get_move)
	end

	private

	def get_move
		print "Move (Player #{type}): "
		move = gets.chomp.split(" ")
		move.map(&:to_i)
	end
end