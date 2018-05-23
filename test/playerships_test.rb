require './test/test_helper'
require './lib/board'
require './lib/computerships'
require './lib/playerships'
require './lib/text'

class PlayerShipsTest < Minitest::Test
  include ComputerShips
  include PlayerShips
  include Text
  def test_p_check_2ship_is_possible_makes_sure_next_cell_is_correct
    board = Board.new
    endpoints1 = 'A1 A2'
    endpoints2 = 'D3 D4'
    actual1 = p_check_2ship_is_possible(board, endpoints1)
    actual2 = p_check_2ship_is_possible(board, endpoints2)
    assert actual1
    assert actual2
  end

  def test_p_check_2ship_is_possible_makes_sure_next_cell_is_incorrect
    board = Board.new
    endpoints1 = 'A1 B2'
    endpoints2 = 'D1 D4'
    actual1 = p_check_2ship_is_possible(board, endpoints1)
    actual2 = p_check_2ship_is_possible(board, endpoints2)
    refute actual1
    refute actual2
  end

  def test_p_check_2ship_issues_finds_diagonal_issue
    board = Board.new
    endpoints1 = 'A1 B2'
    endpoints2 = 'B1 C2'
    actual1 = p_check_2ship_issues(board, endpoints1)
    actual2 = p_check_2ship_issues(board, endpoints2)
    refute actual1
    refute actual2
  end

  def test_p_check_2ship_issues_finds_wrap_issue
    board = Board.new
    endpoints1 = 'A1 D1'
    endpoints2 = 'A1 A4'
    actual1 = p_check_2ship_issues(board, endpoints1)
    actual2 = p_check_2ship_issues(board, endpoints2)
    refute actual1
    refute actual2
  end

  def test_p_check_2ship_issues_finds_length_issue
    board = Board.new
    endpoints1 = 'A1 D1'
    endpoints2 = 'A1 A4'
    actual1 = p_check_2ship_issues(board, endpoints1)
    actual2 = p_check_2ship_issues(board, endpoints2)
    refute actual1
    refute actual2
  end

  def test_p_check_2ship_issues_passes
    board = Board.new
    endpoints1 = 'A1 A2'
    endpoints2 = 'C3 C4'
    actual1 = p_check_2ship_issues(board, endpoints1)
    actual2 = p_check_2ship_issues(board, endpoints2)
    assert actual1
    assert actual2
  end

  def test_p_check_3ship_is_possible_captures_coord_issues
    board = Board.new
    actual1 = p_check_3ship_is_possible(board, ['A1', 'A4'])
    actual2 = p_check_3ship_is_possible(board, ['A1', 'B3'])
    refute actual1
    refute actual2
  end

  def test_p_check_3ship_is_possible_passes
    board = Board.new
    actual1 = p_check_3ship_is_possible(board, ['A1', 'A2', 'A3'])
    actual2 = p_check_3ship_is_possible(board, ['A3', 'B3', 'C3'])
    assert actual1
    assert actual2
  end

  def test_p_calculate_3ship_second_cell_calculates_correctly
    actual1= p_calculate_3ship_second_cell("A1 A3")
    actual2= p_calculate_3ship_second_cell("A3 C3")
    expected1 = ['A1', 'A2', 'A3']
    expected2 = ['A3', 'B3', 'C3']
    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_p_check_3ship_issues_finds_diagonal_issue
    board = Board.new
    endpoints1 = 'A1 B3'
    endpoints2 = 'B1 C3'
    actual1 = p_check_3ship_issues(board, endpoints1, ['D1', 'D2'])
    actual2 = p_check_3ship_issues(board, endpoints2, ['D1', 'D2'])
    refute actual1
    refute actual2
  end

  def test_p_check_3ship_issues_finds_length_issue
    board = Board.new
    endpoints1 = 'A1 A4'
    endpoints2 = 'B1 A1'
    actual1 = p_check_3ship_issues(board, endpoints1, ['D1', 'D2'])
    actual2 = p_check_3ship_issues(board, endpoints2, ['D1', 'D2'])
    refute actual1
    refute actual2
  end

  def test_p_check_3ship_issues_finds_collision_issue
    board = Board.new
    endpoints1 = 'D2 B2'
    endpoints2 = 'A1 C1'
    actual1 = p_check_3ship_issues(board, endpoints1, ['D1', 'D2'])
    actual2 = p_check_3ship_issues(board, endpoints2, ['A1', 'A2'])
    refute actual1
    refute actual2
  end

  def test_p_check_3ship_issues_passes
    board = Board.new
    endpoints1 = 'A1 A3'
    endpoints2 = 'B1 D1'
    actual1 = p_check_3ship_issues(board, endpoints1, ['D1', 'D2'])
    actual2 = p_check_3ship_issues(board, endpoints2, ['A1', 'A2'])
    assert actual1
    assert actual2
  end
end
