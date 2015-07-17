require_relative 'player'
require_relative 'board'
require_relative 'cell'

class Game

	attr_reader :players, :board
	attr_accessor :player

	def initialize(args = {})
		@board   = args.fetch(:board, Board.new(size: 3))
		@players = args.fetch(:players, 
								{first: Player.new(type: "X"), second: Player.new(type: "O")} )
		@player = players[:first]
	end

	def play
		puts "------ Tic Tac Toe -------"
		puts ""
		puts "Moves are between 1 and 9"
		board.display
		loop do
			move = get_next_move
			if board.marked?(move)
				puts "Space marked_with already, please try again"
				next
			end
			board.mark(player.type, move)
			board.display
			break if win? or draw?
			change_player
		end
		print_finish_message
	end

	private

	def get_next_move
		print "Move (Player #{player.type}): "
		human_move = gets.chomp
		convert_move(human_move)
	end

	def change_player
		self.player = (player == players[:first]) ? players[:second] : players[:first]
	end

	def print_finish_message
		puts "Player #{player.type} Wins!" if win?
		puts "Game ended in a tie" if draw?
	end

	def win?
		(straight_win? or diag_win?) ? true : false
	end

	def convert_move(human_move)
		mapping = {
		    "1" => [0, 0],
		    "2" => [0, 1],
		    "3" => [0, 2],
		    "4" => [1, 0],
		    "5" => [1, 1],
		    "6" => [1, 2],
		    "7" => [2, 0],
		    "8" => [2, 1],
		    "9" => [2, 2]
		  }
		mapping[human_move]
	end

	def straight_win?
		t = player.type

		3.times do |row|
			row_count = col_count = 0

			3.times do |col|
				if board.marked_with?(t, [row, col])
					row_count += 1
				end
				if board.marked_with?(t, [col, row])
					col_count += 1
				end
			end

			if row_count == 3 or col_count == 3
				return true
			end
		end
		false
	end

	def diag_win?
		t = player.type
		backward_diag = [[0, 0], [1, 1], [2, 2]]
		forward_diag  = [[2, 0], [1, 1], [0, 2]]

		if backward_diag.all? {|space| board.marked_with?(t, space)} or
			 forward_diag.all?  {|space| board.marked_with?(t, space)}
			true
		else
			false
		end
	end

	def draw?
		board.rows.flatten.all? {|cell| not cell.value.empty?}
	end

end

