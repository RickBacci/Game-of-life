require './starting_board'
require './lib/board'
require './lib/cell'
require './lib/fate'

def setup
  frame_rate 2
  @board = Board.generate_cells(starting_board, 50)
  @cell_size = Board.cell_size
  @array_width = Board.width
  width  = @cell_size * @array_width
  height = @cell_size * @array_width
  size width, height
  smooth
  background 0, 0, 0
end

def draw
  @board.each do |cell|
    if cell.alive?(cell)
      fill 256, 0, 0
      rect cell.x * 50, cell.y * 50, cell.size, cell.size
    else
       fill 0, 0, 0
       rect cell.x * 50, cell.y * 50, cell.size, cell.size
    end
  end
   @board.each do |cell|
     decide_fate(cell)
  end
  tick_tock
end


