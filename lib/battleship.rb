require './lib/board'
require './lib/logic'
require './lib/player'

include Logic

game_menu_options

c_board = Board.new
set_2_ship(c_board)
p_board = Board.new
set_2_ship(p_board)
