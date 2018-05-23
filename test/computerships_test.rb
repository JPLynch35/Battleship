require './test/test_helper'
require './lib/board'
require './lib/computerships'

class ComputerShipsTest < Minitest::Test
  include ComputerShips
  def test_create_3ship_creates_a_3cell_ship
    board = Board.new
    actual = create_3ship(board).length
    assert_equal 3, actual
  end

  def test_create_2ship_creates_a_2cell_ship
    board = Board.new
    actual = create_2ship(board, ['A1', 'A2', 'A3']).length
    assert_equal 2, actual
  end

  def test_first_cell_for_ship_returns_random_cell_on_grid
    board = Board.new
    actual1 = first_cell_for_ship(board)
    actual2 = first_cell_for_ship(board)
    assert board.grid.include?(actual1)
    assert board.grid.include?(actual2)
  end

  def test_find_build_direction_for_3ship_returns_correct_direction
    board = Board.new
    actual = find_build_direction(board, 'A1').length
    assert_equal 1, actual
  end

  def test_next_cell_for_3ship_returns_correct_direction
    actual1 = next_cell_for_ship('A1', 'd')
    actual2 = next_cell_for_ship('D4', 'u')
    assert_equal 'B1', actual1
    assert_equal 'C4', actual2
  end

  def test_build_up_cell_picks_correct_cell
    actual1 = build_up_cell('B1')
    actual2 = build_up_cell('D4')
    expected1 = 'A1'
    expected2 = 'C4'
    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_build_down_cell_picks_correct_cell
    actual1 = build_down_cell('B2')
    actual2 = build_down_cell('C3')
    expected1 = 'C2'
    expected2 = 'D3'
    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_build_left_cell_picks_correct_cell
    actual1 = build_left_cell('B2')
    actual2 = build_left_cell('C3')
    expected1 = 'B1'
    expected2 = 'C2'
    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_build_right_cell_picks_correct_cell
    actual1 = build_right_cell('C1')
    actual2 = build_right_cell('A3')
    expected1 = 'C2'
    expected2 = 'A4'
    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

end
