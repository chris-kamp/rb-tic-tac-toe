# frozen_string_literal: true

# representation of the tic tac toe board
class Board
  attr_reader :board_array

  def initialize
    @board_array = [
      ['[ ]', '[ ]', '[ ]'],
      ['[ ]', '[ ]', '[ ]'],
      ['[ ]', '[ ]', '[ ]'],
    ]
  end

  def display
    ['   1 ', ' 2 ', ' 3 '].each { |header| print header }
    print "\n"
    @board_array.each_with_index do |row, index|
      print "#{index + 1} "
      row.each { |square| print square }
      print "\n"
    end
  end

  def valid_move?(x, y)
    if x.is_a?(Integer) && y.is_a?(Integer) && x.between?(0, 2) &&
         y.between?(0, 2) && @board_array[x][y] == '[ ]'
      true
    else
      false
    end
  end

  def receive_move(x, y, symbol)
    unless symbol == 'X' || symbol == 'O'
      raise 'Error: board received unexpected symbol'
    end
    unless valid_move?(x, y)
      raise 'Error: board received move on occupied or invalid square'
    end
    @board_array[x][y] = "[#{symbol}]"
  end

  def won?
    lines = []
    @board_array.each { |row| lines.push(row) }
    @board_array.transpose.each { |col| lines.push(col) }
    lines.push([@board_array[0][0], @board_array[1][1], @board_array[2][2]])
    lines.push([@board_array[0][2], @board_array[1][1], @board_array[2][0]])
    lines.each do |line|
      return true if line[0] != '[ ]' && line.uniq.count == 1
    end
    false
  end
end
