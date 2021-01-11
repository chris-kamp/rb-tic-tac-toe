require './lib/board.rb'

describe Board do
  describe '#receive_move' do
    it 'returns an array with the specified square marked' do
      expected_board_array = [
        ['[X]', '[ ]', '[ ]'],
        ['[ ]', '[ ]', '[ ]'],
        ['[ ]', '[ ]', '[ ]'],
      ]
      board = Board.new
      board.receive_move([0, 0], 'X')
      expect(board.board_array).to eql(expected_board_array)
    end
    it 'throws an error where square is already marked' do
      board = Board.new
      board.receive_move([0, 0], 'X')
      expect { board.receive_move([0, 0], 'X') }.to raise_error
    end
    it 'throws an error where symbol is not X or O' do
      board = Board.new
      expect { board.receive_move([0, 0], 'Y') }.to raise_error
    end
  end

  describe '#won?' do
    it 'returns true where the board is won vertically' do
      board = Board.new
      board.receive_move([0, 0], 'X')
      board.receive_move([1, 0], 'X')
      board.receive_move([2, 0], 'X')
      expect(board.won?).to eql(true)
    end
    it 'returns true where the board is won horizontally' do
      board = Board.new
      board.receive_move([0, 0], 'O')
      board.receive_move([0, 1], 'O')
      board.receive_move([0, 2], 'O')
      expect(board.won?).to eql(true)
    end
    it 'returns true where the board is won diagonally' do
      board = Board.new
      board.receive_move([2, 0], 'O')
      board.receive_move([1, 1], 'O')
      board.receive_move([0, 2], 'O')
      expect(board.won?).to eql(true)
    end
    it 'does not return false positives' do
      board = Board.new
      board.receive_move([2, 0], 'X')
      board.receive_move([1, 1], 'O')
      board.receive_move([0, 2], 'X')
      expect(board.won?).to eql(false)
    end
  end

  describe '#full?' do
    it 'returns true where the board is full' do
      board = Board.new
      symbols = %w[X O]
      symbols_enum = symbols.cycle
      board.board_array.each_with_index do |row, x|
        row.each_with_index do |_square, y|
          board.receive_move([x, y], symbols_enum.next)
        end
      end
      expect(board.full?).to eql(true)
    end
    it 'returns false where the board is not full' do
      board = Board.new
      board.receive_move([2, 0], 'X')
      board.receive_move([1, 1], 'O')
      board.receive_move([0, 2], 'X')
      expect(board.full?).to eql(false)
    end
  end
end
