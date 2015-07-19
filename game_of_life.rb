require './starting_board'
require './lib/board'
require './lib/cell'
require './lib/fate'

def setup
  @board = Board.generate_cells(starting_board)
  frame_rate 2
  smooth
  width = 800
  height = 600
  size width, height
end

def draw
  @board.each do |cell|
    change_colors(cell)
    decide_fate(cell)
  end
  tick_tock
end

