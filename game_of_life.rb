require './starting_board'
require './lib/board'
require './lib/cell'
require './lib/fate'

def setup
  @board = Board.generate_cells(starting_board)
  frame_rate 2
  smooth
  width = 200
  height = 200
  size width, height
  background 0
end

def draw
  background 0
  @board.each do |cell|
    display_living_cells(cell)
    decide_fate(cell)
  end
  tick_tock
end

