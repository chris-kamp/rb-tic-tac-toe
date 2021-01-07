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
      board.receive_move(0, 0, 'X')
      expect(board.board_array).to eql(expected_board_array)
    end
    it 'throws an error where square is already marked' do
      board = Board.new
      board.receive_move(0, 0, 'X')
      expect { board.receive_move(0, 0, 'X') }.to raise_error
    end
    it 'throws an error where symbol is not X or O' do
      board = Board.new
      expect { board.receive_move(0, 0, 'Y') }.to raise_error
    end
  end

end
