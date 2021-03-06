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

  # Display the game board
  def display
    ['   1 ', ' 2 ', ' 3 '].each { |header| print header }
    print "\n"
    @board_array.each_with_index do |row, index|
      print "#{index + 1} "
      row.each { |square| print square }
      print "\n"
    end
  end

  # Check if a given move is valid
  def valid_move?(coords)
    x = coords[0]
    y = coords[1]
    if x.is_a?(Integer) && y.is_a?(Integer) && x.between?(0, 2) &&
         y.between?(0, 2) && @board_array[x][y] == '[ ]'
      true
    else
      false
    end
  end

  # Mark a given move on the board (if valid)
  def receive_move(coords, symbol)
    x = coords[0]
    y = coords[1]
    unless symbol == 'X' || symbol == 'O'
      raise 'Error: board received unexpected symbol'
    end
    unless valid_move?(coords)
      raise 'Error: board received move on occupied or invalid square'
    end
    @board_array[x][y] = "[#{symbol}]"
  end

  # Check if board has a winner
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

  # Check if the board is full
  def full?
    @board_array.each { |row| return false if row.include?('[ ]') }
    true
  end
end
