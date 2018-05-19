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
c_board.set_3ship(c_board, cells_for_3ship)
c_board.game_board(c_board)

# p_board = Board.new
