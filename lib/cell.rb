require_relative 'board'

class Cell
  include Enumerable
  attr_accessor :x, :y, :current_state,
    :future_state, :size, :neighbors

  def initialize(values)
    @x             = values[:x]
    @y             = values[:y]
    @current_state = values[:current_state]
    @size          = values[:cell_size]
    @board_width   = values[:width]
    @future_state  = 0
    @neighbors     = []
  end

  def each(&block)
    self.each(&block)
  end

  def out_of_bounds(x, y)
    (x < 0 || x == @board_width) || (y < 0 || y == @board_width)
  end

  def coords
    [x, y]
  end

  def neighbor_coords
   [
      [x - 1, y - 1],
      [x, y - 1],
      [x + 1, y - 1],
      [x - 1, y],
      [x + 1, y],
      [x - 1, y + 1],
      [x, y + 1],
      [x + 1, y + 1]
   ].delete_if { |x, y| out_of_bounds(x, y) }
  end

  def neighbors
    #self.neighbors = neighbor_coords.map { |neighbor| board.get_cell(x, y) }
     neighbor_coords.map { |x, y| Board.get_cell(x, y) }
  end

  def living_neighbors
    neighbors.select { |neighbor| neighbor.current_state == 1 }.size
  end
end
