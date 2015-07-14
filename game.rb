require_relative 'player'
require_relative 'board'

class Game

	attr_reader :players, :board
	attr_accessor :turn

	def initialize
		puts "------ Tic Tac Toe -------"
		puts "\n"
		puts "What size board are you playing on: "
		board_size = gets.chomp.to_i
		@board = Board.new(size: board_size)
		@players = {first: Player.new(type: :x), second: Player.new(type: :y)}
		@turn = :first
		win_or_next?
	end

	def win_or_next?
		# unless board.win?
			players[turn].go(board)
			board.display
			change_turn
		# end
	end

	def change_turn
		self.turn = self.turn == :first ? :second : :first
	end
end

