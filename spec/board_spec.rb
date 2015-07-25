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

  it 'can be rectangular' do
    expect(@board.select { |cell| cell.y == 0 }.size).to eq(3)
    expect(@board.select { |cell| cell.x == 0 }.size).to eq(5)
  end

  it 'can add a neighbor cell' do
    cell = @board[0]
    expect cell.neighbors.size == 8

    coords = cell.neighbors.size
    expect(cell.living_neighbors).to_not be_nil
  end

  context 'contains objects' do
    it 'that are Cells' do

      are_all_cells = @board.all? { |cell| cell.is_a? Cell }
      expect(are_all_cells).to be true
    end
  end
end
