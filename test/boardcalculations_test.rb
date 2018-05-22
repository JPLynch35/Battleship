require './test/test_helper'
require './lib/board'
require './lib/boardcalculations'

class BoardCalculationsTest < Minitest::Test
  include BoardCalculations
  def test_it_spots_ships_colliding_while_set
    board1 = Board.new
    board2 = Board.new
    actual1 = board1.check_colliding(['A1', 'A2', 'A3'], ['A1', 'B1'])
    actual2 = board2.check_colliding(['A1', 'C1', 'D1'], ['D1', 'D2'])
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

  def test_check_for_sunken_3ship_properly_flags
    board = Board.new
    board.set_ship(['A1', 'A2', 'A3'])
    shot1 = 'A1'
    shot2 = 'A2'
    shot3 = 'A3'
    board.check_hits(shot1, board.grid)
    board.check_hits(shot2, board.grid)
    actual1 = board.opposing_shots[shot1]
    actual2 = board.opposing_shots[shot2]
    assert_equal 'H', actual1
    assert_equal 'H', actual2
  end

end
