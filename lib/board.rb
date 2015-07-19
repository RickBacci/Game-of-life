require 'pry'
require_relative 'cell'

class Board

  include Enumerable
  attr_accessor :starting_board

  def each(&block)
    @cells.each(&block)
  end

  def self.width
    @cells.select { |cell| cell.y == 0 }.size
  end

  def self.height
    @cells.select { |cell| cell.x == 0 }.size
  end

  def self.generate_cells(starting_board)
    @cells = []
    starting_board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        @cells << Cell.new(x: x, y: y, current_state: cell)
      end
    end
    @cells
  end

  def self.get_cell(x, y)
    @cells.detect { |cell| cell.x == x && cell.y == y }
  end

end

