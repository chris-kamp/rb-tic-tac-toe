require './lib/board.rb'

class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  # Ask the player for a move
  def ask_move
    puts "Player #{@mark}, enter your move.\n\n"
    puts 'Row: '
    begin
      x = Integer(gets.chomp)
    rescue StandardError
      puts 'Invalid row. Try again.'
      retry
    end
    puts 'Column: '
    begin
      y = Integer(gets.chomp)
    rescue StandardError
      puts 'Invalid column. Try again.'
      retry
    end

    # - 1 to account for zero-indexing
    [x - 1, y - 1]
  end

  # Ask the player for a move until a valid move is received
  def pick_move(board)
    # Consider removing first line
    move = ask_move
    until board.valid_move?(move[0], move[1])
      puts "Invalid move. Try again.\n\n"
      move = ask_move
    end
    move
  end
end
