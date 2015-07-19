require './starting_board'
require 'cell'
require 'board'
require './lib/fate'

require 'pry'

RSpec.describe Cell do
  before do
    @board = Board.generate_cells(starting_board)
  end

  it 'can exist' do
    expect(Cell.new(x: 1, y: 1, current_state: 1, cell_size: 1))
  end

  it 'has default values' do
    cell = Cell.new(x: 2, y: 3, current_state: 1, cell_size: 1)

    expect(cell.x).to be(2)
    expect(cell.y).to be(3)
    expect(cell.current_state).to eq(1)
    expect(cell.size).to eq(1)
    expect(cell.future_state).to eq(0)
  end

  it 'has 8 neighbors' do
    cell = @board[4]

    expect(cell.neighbor_coords.size).to eq 8
  end

  it 'has less than 8 neighbors if neighbors are out of bounds' do

    expect(@board[0].neighbor_coords.size).to eq 3
  end


  it 'can find neighbor objects' do
    expect(@board.first.is_a? Cell)
  end

  it 'can find all neighbors' do
    expect(@board[4].neighbors.size).to eq(8)
  end

  it 'can find out how many living neighbors it has' do
    expect(@board[4].living_neighbors).to eq(2)
  end

  it 'dies if it has less than 2 neighbors' do
    cell = @board[1]

    expect(cell.living_neighbors).to eq(1)
    expect(cell.current_state).to eq(1)
    decide_fate(cell)

    expect(cell.future_state).to eq(0)

    cell = @board[7]

    expect(cell.living_neighbors).to eq(1)
    expect(cell.current_state).to eq(1)
    decide_fate(cell)

    expect(cell.future_state).to eq(0)
  end

  it 'lives if it has 2 or 3 neighbors' do
    cell = @board[4]

    expect(cell.living_neighbors).to eq(2)
    expect(cell.current_state).to eq(1)
    decide_fate(cell)

    expect(cell.future_state).to eq(1)
  end

  it 'it comes alive with exactly  3 neighbors' do
    cell = @board[3]

    expect(cell.living_neighbors).to eq(3)
    expect(cell.current_state).to eq(0)
    decide_fate(cell)

    expect(cell.future_state).to eq(1)
  end
end
