require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_grid_starts_with_spaces
    board = Board.new
    actual = board.grid.values.all? {|value| value == ' '}
    assert actual
  end

  def test_opposing_shots_starts_with_spaces
    board = Board.new
    actual = board.opposing_shots.values.all? {|value| value == ' '}
    assert actual
  end

  def test_grid_rules_for_3ship_contains_direction_rules
    board = Board.new
    actual = board.grid_rules_3ship
    expected = {
      'A1' => ['d','r'], 'A2' => ['d','r'],
      'A3' => ['d','l'], 'A4' => ['d','l'],
      'B1' => ['d','r'], 'B2' => ['d','r'],
      'B3' => ['d','l'], 'B4' => ['d','l'],
      'C1' => ['u','r'], 'C2' => ['u','r'],
      'C3' => ['u','l'], 'C4' => ['u','l'],
      'D1' => ['u','r'], 'D2' => ['u','r'],
      'D3' => ['u','l'], 'D4' => ['u','l']
    }
    assert_equal expected, actual
  end

  def test_grid_rules_for_2ship_contains_direction_rules
    board = Board.new
    actual = board.grid_rules_2ship
    expected = {
      'A1' => ['d','r'],          'A2' => ['d','r','l'],
      'A3' => ['d','l','r'],      'A4' => ['d','l'],
      'B1' => ['u','d','r'],      'B2' => ['u','d','r','l'],
      'B3' => ['u','d','r','l'],  'B4' => ['u','d','l'],
      'C1' => ['u','d','r'],      'C2' => ['u','d','r','l'],
      'C3' => ['u','d','r','l'],  'C4' => ['u','d','l'],
      'D1' => ['u','r'],          'D2' => ['u','l','r'],
      'D3' => ['u','l','r'],      'D4' => ['u','l']
    }
    assert_equal expected, actual
  end

  def test_game_board_displays_board
    board = Board.new
    actual = board.game_board
    expected = (
      puts "==========="
      puts ". 1 2 3 4"
      puts "A #{board.grid['A1']} #{board.grid['A2']} #{board.grid['A3']} #{board.grid['A4']}"
      puts "B #{board.grid['B1']} #{board.grid['B2']} #{board.grid['B3']} #{board.grid['B4']}"
      puts "C #{board.grid['C1']} #{board.grid['C2']} #{board.grid['C3']} #{board.grid['C4']}"
      puts "D #{board.grid['D1']} #{board.grid['D2']} #{board.grid['D3']} #{board.grid['D4']}"
      puts "==========="
    )
    assert_output(expected) {actual}
  end

  def test_opposing_shots_board_displays_opposing_shots
    board = Board.new
    actual = board.opposing_shots_board
    expected = (
      puts "Shot History"
      puts "==========="
      puts ". 1 2 3 4"
      puts "A #{board.opposing_shots['A1']} #{board.opposing_shots['A2']} #{board.opposing_shots['A3']} #{board.opposing_shots['A4']}"
      puts "B #{board.opposing_shots['B1']} #{board.opposing_shots['B2']} #{board.opposing_shots['B3']} #{board.opposing_shots['B4']}"
      puts "C #{board.opposing_shots['C1']} #{board.opposing_shots['C2']} #{board.opposing_shots['C3']} #{board.opposing_shots['C4']}"
      puts "D #{board.opposing_shots['D1']} #{board.opposing_shots['D2']} #{board.opposing_shots['D3']} #{board.opposing_shots['D4']}"
      puts "==========="
    )
    assert_output(expected) {actual}
  end

  def test_set_2ship
    board = Board.new
    actual = board.set_ship(['A1', 'A2'])
    expected = ['A1', 'A2']
    assert_equal expected, actual
  end
end
