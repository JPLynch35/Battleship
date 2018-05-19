require './lib/board'
require './lib/logic'
require './lib/player'

include Logic
include Ship
include Text

welcome_screen
player_menu_choice

c_board = Board.new
cells_for_3ship = create_3ship(c_board)


p_board = Board.new
create_3ship(p_board)
