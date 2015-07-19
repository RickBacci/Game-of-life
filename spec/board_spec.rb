require 'pry'
require 'cell'
require 'board'
require './starting_board'


RSpec.describe Board do
  before do
    @board = Board.generate_cells(test_board)
  end

  it 'can exist' do
    expect(@board)
    expect(@cells)
  end

  it 'is given a starting_board, cell_size defaults to 1' do
    expect(Board.width).to eq(3)
    expect(Board.height).to eq(5)
  end

  it 'contains the correct number of cells' do
     expect(@board.size).to eq(15)
  end

  context 'contains objects' do
    it 'that are Cells' do

      are_all_cells = @board.all? { |cell| cell.is_a? Cell }
      expect(are_all_cells).to be true
    end
  end
end
