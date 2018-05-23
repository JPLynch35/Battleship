require './test/test_helper'
require './lib/board'
require './lib/computerships'
require './lib/playerships'
require './lib/text'

class PlayerShipsTest < Minitest::Test
  include ComputerShips
  include PlayerShips
  include Text

  def test_p_2ship_issues_finds_diagonal_issue
    board = Board.new
    endpoints1 = 'A1 B2'
    endpoints2 = 'B1 C2'
    actual1 = p_2ship_issues?(board, endpoints1)
    actual2 = p_2ship_issues?(board, endpoints2)
    refute actual1
    refute actual2
  end

  def test_p_2ship_issues_finds_wrap_issue
    board = Board.new
    endpoints1 = 'A1 D1'
    endpoints2 = 'A1 A4'
    actual1 = p_2ship_issues?(board, endpoints1)
    actual2 = p_2ship_issues?(board, endpoints2)
    refute actual1
    refute actual2
  end

  def test_p_2ship_issues_finds_length_issue
    board = Board.new
    endpoints1 = 'A1 A3'
    endpoints2 = 'D4 A4'
    actual1 = p_2ship_issues?(board, endpoints1)
    actual2 = p_2ship_issues?(board, endpoints2)
    refute actual1
    refute actual2
  end

  def test_p_2ship_issues_passes
    board = Board.new
    endpoints1 = 'A1 A2'
    endpoints2 = 'C3 C4'
    actual1 = p_2ship_issues?(board, endpoints1)
    actual2 = p_2ship_issues?(board, endpoints2)
    assert actual1
    assert actual2
  end

  def test_p_2ship_which_issues_returns_false_validity_for_diagonal
    board = Board.new
    wrap = p_ship_wrap?("A1 B3")
    length = p_check_2ship_length(board, "A1 B3")
    diagonal = p_ship_diagonal?(board, "A1 B3")
    actual = p_2ship_which_issues?(diagonal, wrap, length)
    refute actual
  end

  def test_p_2ship_which_issues_returns_false_validity_for_wrap
    board = Board.new
    wrap = p_ship_wrap?("A1 A4")
    length = p_check_2ship_length(board, "A1 A4")
    diagonal = p_ship_diagonal?(board, "A1 A4")
    actual = p_2ship_which_issues?(diagonal, wrap, length)
    refute actual
  end

  def test_p_2ship_which_issues_returns_false_validity_for_length
    board = Board.new
    wrap = p_ship_wrap?("A1 A3")
    length = p_check_2ship_length(board, "A1 A3")
    diagonal = p_ship_diagonal?(board, "A1 A3")
    actual = p_2ship_which_issues?(diagonal, wrap, length)
    refute actual
  end

  def test_p_2ship_which_issues_returns_true_validity
    board = Board.new
    wrap = p_ship_wrap?("A1 A2")
    length = p_check_2ship_length(board, "A1 A2")
    diagonal = p_ship_diagonal?(board, "A1 A2")
    actual = p_2ship_which_issues?(diagonal, wrap, length)
    assert actual
  end

  def test_p_calculate_3ship_second_cell_calculates_correctly
    actual1= p_calculate_3ship_second_cell("A1 A3")
    actual2= p_calculate_3ship_second_cell("A3 C3")
    expected1 = ['A1', 'A2', 'A3']
    expected2 = ['A3', 'B3', 'C3']
    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_p_3ship_issues_finds_diagonal_issue
    board = Board.new
    endpoints1 = 'A1 B3'
    endpoints2 = 'B1 C3'
    actual1 = p_3ship_issues?(board, endpoints1, ['D1', 'D2'])
    actual2 = p_3ship_issues?(board, endpoints2, ['D1', 'D2'])
    refute actual1
    refute actual2
  end

  def test_p_3ship_issues_finds_length_issue
    board = Board.new
    endpoints1 = 'A1 A4'
    endpoints2 = 'B1 A1'
    actual1 = p_3ship_issues?(board, endpoints1, ['D1', 'D2'])
    actual2 = p_3ship_issues?(board, endpoints2, ['D1', 'D2'])
    refute actual1
    refute actual2
  end

  def test_p_3ship_issues_finds_collision_issue
    board = Board.new
    endpoints1 = 'D2 B2'
    endpoints2 = 'A1 C1'
    actual1 = p_3ship_issues?(board, endpoints1, ['D1', 'D2'])
    actual2 = p_3ship_issues?(board, endpoints2, ['A1', 'A2'])
    refute actual1
    refute actual2
  end

  def test_p_3ship_issues_passes
    board = Board.new
    endpoints1 = 'A1 A3'
    endpoints2 = 'B1 D1'
    actual1 = p_3ship_issues?(board, endpoints1, ['D1', 'D2'])
    actual2 = p_3ship_issues?(board, endpoints2, ['A1', 'A2'])
    assert actual1
    assert actual2
  end

  def test_p_3ship_which_issues_returns_false_validity_for_diagonal
    board = Board.new
    cells_for_3ship = p_calculate_3ship_second_cell("A1 B3")
    diagonal = p_ship_diagonal?(board, "A1 B3")
    length = p_check_3ship_length(board, "A1 B3")
    collision = board.colliding?(cells_for_3ship, ['A1', 'A2'])
    actual = p_3ship_which_issues?(diagonal, length, collision)
    refute actual
  end

  def test_p_3ship_which_issues_returns_false_validity_for_length
    board = Board.new
    cells_for_3ship = p_calculate_3ship_second_cell("A1 A4")
    diagonal = p_ship_diagonal?(board, "A1 A4")
    length = p_check_3ship_length(board, "A1 A4")
    collision = board.colliding?(cells_for_3ship, ['A1', 'A2'])
    actual = p_3ship_which_issues?(diagonal, length, collision)
    refute actual
  end

  def test_p_3ship_which_issues_returns_false_validity_for_collision
    board = Board.new
    cells_for_3ship = p_calculate_3ship_second_cell("A1 C1")
    diagonal = p_ship_diagonal?(board, "A1 C1")
    length = p_check_3ship_length(board, "A1 C1")
    collision = board.colliding?(cells_for_3ship, ['A1', 'A2'])
    actual = p_3ship_which_issues?(diagonal, length, collision)
    refute actual
  end

  def test_p_3ship_which_issues_returns_true_validity
    board = Board.new
    cells_for_3ship = p_calculate_3ship_second_cell("A1 A3")
    diagonal = p_ship_diagonal?(board, "A1 A3")
    length = p_check_3ship_length(board, "A1 A3")
    collision = board.colliding?(cells_for_3ship, ['B1', 'B2'])
    actual = p_3ship_which_issues?(diagonal, length, collision)
    assert actual
  end
end
