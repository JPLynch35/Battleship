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

end
