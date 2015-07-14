require_relative 'player'
require_relative 'board'

class Game

	attr_reader :players, :board

	def initialize
		puts "------ Tic Tac Toe -------"
		puts "\n"
		@board = Board.new(size: 3)
		@players = {first: Player.new(type: :x), 
								second: Player.new(type: :y)}
		@current_player = @players[:first]
	end

	def play
		loop do
			@current_player.go(board)
			board.display
			break if win?
			change_player
		end
		puts "Player #{@current_player.type.to_s} Wins!"
	end

	private

	def change_player
		if @current_player == players[:first]
			@current_player = players[:second]
		else
			@current_player = players[:first]
		end
	end

	def win?
		if straight_win?(:row) or straight_win?(:col) or diag_win?
			true
		else
			false
		end
	end

	def diag_win?
		t = @current_player.type.to_s
		backward_diag = [[0, 0], [1, 1], [2, 2]]
		forward_diag  = [[2, 0], [1, 1], [0, 2]]

		if backward_diag.all? {|space| board.marked?(t, space)} or
			 forward_diag.all?  {|space| board.marked?(t, space)}
			true
		else
			false
		end
	end

	def straight_win?(direction)
		3.times do |row|
			count_marks = 0
			3.times do |col|
				space = (direction == :row) ? [row, col] : [col, row]
				if board.marked?(@current_player.type.to_s, space)
					count_marks += 1
				end
			end
			if count_marks == 3
				return true
			end
		end
		false
	end

end

