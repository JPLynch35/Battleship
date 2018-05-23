require './test/test_helper'
require './lib/board'
require './lib/boardcalculations'

class BoardCalculationsTest < Minitest::Test
  include BoardCalculations
  def test_it_spots_ships_colliding_while_set
    board1 = Board.new
    board2 = Board.new
    actual1 = board1.colliding?(['A1', 'A2', 'A3'], ['A1', 'B1'])
    actual2 = board2.colliding?(['A1', 'C1', 'D1'], ['D1', 'D2'])
    assert actual1
    assert actual2
  end

  def test_checkhits_correctly_identifies_misses
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'B1'
    shot2 = 'D1'
    assert_output(stdout = "Miss.\n" ) {board.check_hits(shot1, board.grid)}
    assert_output(stdout = "Miss.\n" ) {board.check_hits(shot2, board.grid)}
  end

  def test_checkhits_correctly_identifies_misses_on_grid
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'B1'
    shot2 = 'D1'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual1 = board.grid[shot1]
    actual2 = board.grid[shot2]
    assert_equal 'M', actual1
    assert_equal 'M', actual2
  end

  def test_checkhits_correctly_identifies_misses_on_opposingshots
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'B1'
    shot2 = 'D1'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual1 = board.opposing_shots[shot1]
    actual2 = board.opposing_shots[shot2]
    assert_equal 'M', actual1
    assert_equal 'M', actual2
  end

  def test_check_hits_correctly_identifies_hits
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    shot2 = 'A2'
    assert_output(stdout = "Hit!\n" ) {board.check_hits(shot1, board.grid)}
    assert_output(stdout = "Hit!\n" ) {board.check_hits(shot2, board.grid)}
  end

  def test_checkhits_correctly_identifies_hits_on_grid
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    shot2 = 'A2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual1 = board.grid[shot1]
    actual2 = board.grid[shot2]
    assert_equal 'H', actual1
    assert_equal 'H', actual2
  end

  def test_checkhits_correctly_identifies_hits_on_opposingshots
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    shot2 = 'A2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual1 = board.opposing_shots[shot1]
    actual2 = board.opposing_shots[shot2]
    assert_equal 'H', actual1
    assert_equal 'H', actual2
  end

  def test_count_hits_correctly_counts
    board = Board.new
    board.set_ship(['A1', 'A2', 'A3'])
    shot1 = 'A1'
    shot2 = 'A2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual = board.count_hits(board.opposing_shots)
    assert_equal 2, actual
  end

  def test_sunken_3ship_properly_flags_as_not_sunk
    board = Board.new
    board.set_ship(['A1', 'A2', 'A3'])
    shot1 = 'A1'
    shot2 = 'A2'
    shot3 = 'A4'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    board.check_hits(shot3, board.grid)
    actual = board.sunken_3ship?(false, board.grid)
    refute actual
  end

  def test_sunken_3ship_properly_flags_as_sunk
    board = Board.new
    board.set_ship(['A1', 'A2', 'A3'])
    shot1 = 'A1'
    shot2 = 'A2'
    shot3 = 'A3'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    board.check_hits(shot3, board.grid)
    actual = board.sunken_3ship?(false, board.grid)
    assert actual
  end

  def test_sunken_3ship_properly_flags_as_already_sunk
    board = Board.new
    board.set_ship(['A1', 'A2', 'A3'])
    shot1 = 'A1'
    shot2 = 'A2'
    shot3 = 'A3'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    board.check_hits(shot3, board.grid)
    actual = board.sunken_3ship?(true, board.grid)
    assert actual
  end

  def test_any_3s_left_identifies_3s
    board = Board.new
    board.set_ship(['A1', 'A2', 'A3'])
    shot1 = 'A1'
    shot2 = 'A2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual = any_3s_left?(board.grid)
    refute actual
  end

  def test_any_3s_left_identifies_no_more_3s
    board = Board.new
    board.set_ship(['A1', 'A2', 'A3'])
    shot1 = 'A1'
    shot2 = 'A2'
    shot3 = 'A3'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    board.check_hits(shot3, board.grid)
    actual = any_3s_left?(board.grid)
    assert actual
  end

  def test_sunken_2ship_properly_flags_as_not_sunk
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    shot2 = 'D2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual = board.sunken_2ship?(false, board.grid)
    refute actual
  end

  def test_sunken_2ship_properly_flags_as_sunk
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    shot2 = 'A2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual = board.sunken_2ship?(false, board.grid)
    assert actual
  end

  def test_sunken_2ship_properly_flags_as_already_sunk
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    shot2 = 'A2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual = board.sunken_2ship?(true, board.grid)
    assert actual
  end

  def test_any_2s_left_identifies_2s
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    board.check_hits(shot1, board.grid)
    actual = any_2s_left?(board.grid)
    refute actual
  end

  def test_any_2s_left_identifies_no_more_2s
    board = Board.new
    board.set_ship(['A1', 'A2'])
    shot1 = 'A1'
    shot2 = 'A2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual = any_2s_left?(board.grid)
    assert actual
  end

  def test_win_detects_win
    board = Board.new
    board.set_ship(['A1', 'A2','A3'])
    board.set_ship(['D1', 'D2'])
    shot1 = 'A1'
    shot2 = 'A2'
    shot3 = 'A3'
    shot4 = 'D1'
    shot5 = 'D2'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    board.check_hits(shot3, board.grid)
    board.check_hits(shot4, board.grid)
    board.check_hits(shot5, board.grid)
    hits = board.count_hits(board.opposing_shots)
    assert board.win?(hits)
  end

  def test_win_detects_no_win_yet
    board = Board.new
    board.set_ship(['A1', 'A2','A3'])
    board.set_ship(['D1', 'D2'])
    shot1 = 'A1'
    shot2 = 'A2'
    shot3 = 'A3'
    shot4 = 'D1'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    board.check_hits(shot3, board.grid)
    board.check_hits(shot4, board.grid)
    hits = board.count_hits(board.opposing_shots)
    refute board.win?(hits)
  end

  def test_time_check_correctly_checks_time
    board = Board.new
    start = Time.now
    sleep(2)
    finish = Time.now
    actual = board.time_check(start, finish)
    assert_equal 2, actual
  end

end
