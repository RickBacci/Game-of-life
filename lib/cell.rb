require_relative 'board'

class Cell
  include Enumerable
  attr_accessor :x, :y, :current_state, :future_state

  def initialize(values)
    @x             = values[:x]
    @y             = values[:y]
    @current_state = values[:current_state]
    @future_state  = 0
  end

  def each(&block)
    self.each(&block)
  end

  def size
    Board.cell_size
  end
  def out_of_bounds(x, y)
    (x < 0 || x == Board.width) || (y < 0 || y == Board.width)
  end

  def alive?(cell)
    cell.current_state == 1
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
     neighbor_coords.map { |x, y| Board.get_cell(x, y) }
  end

  def living_neighbors
    neighbors.select { |neighbor| neighbor.current_state == 1 }.size
  end
end
