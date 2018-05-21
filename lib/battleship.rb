require './lib/board'
require './lib/computer'
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
# c_board.game_board #can delete this line, just showing computer board for testing

p_board = Board.new
p_cells_for_2ship = player.input_2ship(p_board)
p_board.set_ship(p_cells_for_2ship)
p_cells_for_3ship = player.input_3ship(p_board, p_cells_for_2ship)
p_board.set_ship(p_cells_for_3ship)
# p_board.game_board #can delete this line, just showing computer board for testing

loop do
  puts your_turn
  c_board.opposing_shots_board
  puts fire_prompt
  shot = player.input_shot(c_board, player.total_shots)
  c_board.check_hits(shot)
  c_board.check_for_sunken_3ship(c_board)
  c_board.check_for_sunken_2ship(c_board)
  c_board.opposing_shots_board
  hits = c_board.count_hits
  p_win = c_board.check_for_win(hits)
  if p_win == true
    puts win
    break
  end
  player.press_enter_to_continue

  puts enemy_turn
  shot = computer.randomize_shot(p_board)
  computer.announce_shot(shot)
  p_board.check_hits(shot)
  p_board.check_for_sunken_3ship(p_board)
  p_board.check_for_sunken_2ship(p_board)
  p_board.opposing_shots_board
  hits = p_board.count_hits
  c_win = p_board.check_for_win(hits)
  if c_win == true
    puts lose
    break
  end
  player.press_enter_to_continue
end

finish = Time.now
time = p_board.time_check(start, finish)
puts metrics_to_finish(player.total_shots.length, p_board.finish_minutes, p_board.finish_seconds)
