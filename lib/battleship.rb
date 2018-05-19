require './lib/board'
require './lib/player'
require './lib/ship'
require './lib/text'

include Ship
include Text

player = Player.new
puts welcome_screen
player.menu_choice

c_board = Board.new
c_cells_for_3ship = create_3ship(c_board)
c_board.set_ship(c_board, c_cells_for_3ship)
c_cells_for_2ship = create_2ship(c_board, c_cells_for_3ship)
c_board.set_ship(c_board, c_cells_for_2ship)
c_board.game_board(c_board) #can delete this line, just showing computer board for testing

p_board = Board.new
p_cells_for_2ship = player.input_2ship(p_board)
p_board.set_ship(p_board, p_cells_for_2ship)
c_board.game_board(p_board) #can delete this line, just showing computer board for testing



# p_board = Board.new
