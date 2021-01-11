require './lib/board.rb'
require './lib/player.rb'

board = Board.new
player1 = Player.new('X')
player2 = Player.new('O')
players = [player1, player2]
players_enum = players.cycle

puts "----- ----- -----\nTIC TAC TOE\n----- ----- -----"
board.display
until board.won?
  current_player = players_enum.next
  board.receive_move(current_player.pick_move(board), current_player.mark)
  board.display
end
puts "\nPLAYER #{current_player.mark} WINS!"
