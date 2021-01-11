# frozen_string_literal: true

require './lib/board'
require './lib/player'

# Set up board and players
board = Board.new
player1 = Player.new('X')
player2 = Player.new('O')
players = [player1, player2]

# An enumerable to allow cycling through players with "next"
players_enum = players.cycle

# Main game loop
puts "----- ----- -----\nTIC TAC TOE\n----- ----- -----"
board.display
until (board.won? || board.full?)
  current_player = players_enum.next
  board.receive_move(current_player.pick_move(board), current_player.mark)
  board.display
end

