require './lib/board'
require './lib/logic'
require './lib/player'
require './lib/text'

logic = Logic.new
text = Text.new
logic.game_menu_options(text)

p_board = Board.new
c_board = Board.new
