require './lib/board'
require './lib/logic'
require './lib/player'
require './lib/ship'

include Logic
include Ship
include Text

welcome_screen
player_menu_choice

c_board = Board.new
cells_for_3ship = create_3ship(c_board)
c_board.set_ship(c_board, cells_for_3ship)
c_board.game_board(c_board) #can delete this line, just showing computer board for testing
cells_for_2ship = create_2ship(c_board)
cells_for_2ship = c_board.check_colliding(c_board, cells_for_3ship, cells_for_2ship)
c_board.set_ship(c_board, cells_for_2ship)
c_board.game_board(c_board) #can delete this line, just showing computer board for testing

# p_board = Board.new
