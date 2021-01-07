# frozen_string_literal: true

# representation of the tic tac toe board
class Board
  def initialize
    @board_array = [
      ['[ ]', '[ ]', '[ ]'],
      ['[ ]', '[ ]', '[ ]'],
      ['[ ]', '[ ]', '[ ]'],
    ]
  end
  def display
    ['   A ', ' B ', ' C '].each { |header| print header }
    print "\n"
    @board_array.each_with_index do |row, index|
      print "#{index + 1} "
      row.each { |square| print square }
      print "\n"
    end
  end
end
