require './starting_board'
require './lib/board'
require './lib/cell'
require './lib/fate'

def setup
  @board       = Board.generate_cells(starting_board, 800, 600, 1)
  cell_size    = Board.cell_size
  array_width  = Board.width
  width        = cell_size * array_width
  height       = cell_size * array_width
  frame_rate 2
  smooth
  size width, height
end

def draw
  @board.each do |cell|
    change_colors(cell)
    decide_fate(cell)
  end
  tick_tock
end

