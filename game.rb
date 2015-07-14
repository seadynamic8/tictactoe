class Game

	attr_reader :players, :board, :turn

	def initialize
		puts "------ Tic Tac Toe -------"
		puts "\n"
		puts "What size board are you playing on: "
		board_size = gets.chomp.to_i
		@board = Board.new(board_size)
		@players = {first: Player.new(:X), second: Player.new(:Y)}
		@turn = :first
	end

	def win_or_next?
		unless board.win?
			players[turn].go(board)
			change_turn
		end
	end

	def change_turn
		self.turn = self.turn == :first ? :second : :first
	end
end

