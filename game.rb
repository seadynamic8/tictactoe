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
	end

	def play
		until win?
			change_player
			players[turn].go(board)
			board.display
		end
		puts "Player #{@current_player.type.to_s} Wins!"
	end

	def change_player
		if @current_player = nil
			@current_player = :first
		else
			@current_player = (@current_player == :first) ? :second : :first
		end
	end

	def win?
		if row_win? or col_win? or diag_win?
			true
		else
			false
		end
	end

	def row_win?
		3.times do |row|
			if board[row].all? {|space| space == @current_player.type}
				return true
			end
		end
		false
	end

	def col_win?
		3.times do |row|
			count_marks = 0
			3.times do |col|
				if board[row][col] == @current_player.type
					count_marks += 1
				end
			end
			if count_marks == 3
				return true
			end
		end
		false
	end

	def diag_win?
		t = @current_player.type
		if board[1][1] == t and
			((board[0][0] == t and board[2][2] == t) or
			 (board[2][0] == t and board[0, 2] == t))
			true
		else
			false
		end
	end

end

