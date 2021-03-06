require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/computerships'
require './lib/playerships'
require './lib/text'

include ComputerShips
include PlayerShips
include Text

player = Player.new
computer = Computer.new
puts welcome_screen
player.menu_choice
start = Time.now

c_board = Board.new
c_3ship_cells = create_3ship(c_board)
c_board.set_ship(c_3ship_cells)
c_2ship_cells = create_2ship(c_board, c_3ship_cells)
c_board.set_ship(c_2ship_cells)
p_board = Board.new
p_2ship_cells = player.input_2ship(p_board)
p_board.set_ship(p_2ship_cells)
p_3ship_cells = player.input_3ship(p_board, p_2ship_cells)
p_board.set_ship(p_3ship_cells)

p_sunk_c_3ship = false
p_sunk_c_2ship = false
c_sunk_p_3ship = false
c_sunk_p_2ship = false
loop do
  puts p_turn
  c_board.opposing_shots_board
  puts fire_prompt
  shot = player.input_shot(c_board, player.total_shots)
  c_board.check_hits(shot, c_board.grid)
  p_sunk_c_3ship = c_board.sunken_3ship?(p_sunk_c_3ship, c_board.grid)
  p_sunk_c_2ship = c_board.sunken_2ship?(p_sunk_c_2ship, c_board.grid)
  c_board.opposing_shots_board
  hits = c_board.count_hits(c_board.opposing_shots)
  p_win = c_board.win?(hits)
  if p_win == true
    puts win
    break
  end
  player.press_enter_to_continue

  puts c_turn
  shot = computer.randomize_shot(p_board)
  computer.announce_shot(shot)
  p_board.check_hits(shot, p_board.grid)
  c_sunk_p_3ship = p_board.sunken_3ship?(c_sunk_p_3ship, p_board.grid)
  c_sunk_p_2ship = p_board.sunken_2ship?(c_sunk_p_2ship, p_board.grid)
  p_board.game_board
  hits = p_board.count_hits(p_board.opposing_shots)
  c_win = p_board.win?(hits)
  if c_win == true
    puts lose
    break
  end
  player.press_enter_to_continue
end

finish = Time.now
time = p_board.time_check(start, finish)
puts metrics_to_finish(player.total_shots.length, p_board.finish_min, p_board.finish_sec)
