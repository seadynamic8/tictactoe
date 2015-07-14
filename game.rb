require_relative 'player'
require_relative 'board'

class Game

	attr_reader :players, :board

	def initialize
		@board = Board.new(size: 3)
		@players = {first:  Player.new(type: :x), 
								second: Player.new(type: :y)}
		@player = @players[:first]
	end

	def play
		puts "------ Tic Tac Toe -------"
		puts "\n"
		board.display
		loop do
			@player.go(board)
			board.display
			break if win?
			change_player
		end
		puts "Player #{@player.type.to_s} Wins!"
	end

	private

	def change_player
		if @player == players[:first]
			@player = players[:second]
		else
			@player = players[:first]
		end
	end

	def win?
		if straight_win? or diag_win?
			true
		else
			false
		end
	end

	def straight_win?
		t = @player.type.to_s

		3.times do |row|
			row_count = col_count = 0

			3.times do |col|
				if board.marked?(t, [row, col])
					row_count += 1
				end
				if board.marked?(t, [col, row])
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
		t = @player.type.to_s
		backward_diag = [[0, 0], [1, 1], [2, 2]]
		forward_diag  = [[2, 0], [1, 1], [0, 2]]

		if backward_diag.all? {|space| board.marked?(t, space)} or
			 forward_diag.all?  {|space| board.marked?(t, space)}
			true
		else
			false
		end
	end

end

