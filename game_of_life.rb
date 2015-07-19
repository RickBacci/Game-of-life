require './starting_board'
require './lib/board'
require './lib/cell'


board = Board.generate_cells(starting_board)
p board[4].neighbors.size
board.select { |cell| p cell if  cell.current_state == 1 }

