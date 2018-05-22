require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_grid_starts_with_spaces
    board = Board.new
    assert_equal ' ', board.grid['A1']
    assert_equal ' ', board.grid['C1']
  end

  def test_opposing_shots_starts_with_spaces
    board = Board.new
    assert_equal ' ', board.opposing_shots['A1']
    assert_equal ' ', board.opposing_shots['C1']
  end

  def test_grid_rules_for_3ship_contains_direction_rules
    board = Board.new
    assert_equal ['d','r'], board.grid_rules_3ship['B2']
    assert_equal ['u','r'], board.grid_rules_3ship['D1']
  end

  def test_grid_rules_for_2ship_contains_direction_rules
    board = Board.new
    assert_equal ['u','d','r'], board.grid_rules_2ship['B1']
    assert_equal ['u','d','l'], board.grid_rules_2ship['C4']
  end

  def test_set_2ship
    board = Board.new
    actual = board.set_ship(['A1', 'A2'])
    expected = ['A1', 'A2']
    assert_equal expected, actual
  end

end
