require './lib/board'
require './lib/player'
require './lib/ship'
require './lib/ship_validator'
require './lib/text'

include Ship
include Ship_Validator
include Text

player = Player.new
computer = Computer.new
puts welcome_screen
player.menu_choice
start = Time.now

c_board = Board.new
c_cells_for_3ship = create_3ship(c_board)
c_board.set_ship(c_cells_for_3ship)
c_cells_for_2ship = create_2ship(c_board, c_cells_for_3ship)
c_board.set_ship(c_cells_for_2ship)
c_board.game_board #can delete this line, just showing computer board for testing

p_board = Board.new
p_cells_for_2ship = player.input_2ship(p_board)
p_board.set_ship(p_cells_for_2ship)
p_cells_for_3ship = player.input_3ship(p_board, p_cells_for_2ship)
p_board.set_ship(p_cells_for_3ship)
p_board.game_board #can delete this line, just showing computer board for testing

loop do
  c_board.opposing_shots_board
  puts fire_prompt
  shot = player.input_shot(c_board, player.total_shots)
  hits = c_board.check_hits(shot)
  c_board.opposing_shots_board
  p_win = c_board.check_for_win(hits)
  if p_win == 1
    puts win
    finish = Time.now
    break
  end

  shot = computer.randomiz_shot(p_board)
  hits = p_board.check_hits(shot)
  p_board.opposing_shots_board
  c_win = p_board.check_for_win(hits)
  if c_win == 1
    puts lose
    finish = Time.now
    break
  end
end

time = p_board.time_check(start, finish)
puts shots_to_finish(player.total_shots.length)
puts time_to_finish(time)
