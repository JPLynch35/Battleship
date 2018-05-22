require './test/test_helper'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_does_it_exist
    computer = Computer.new
    assert_instance_of Computer, computer
  end

  def test_computer_class_attribute
    computer = Computer.new
    assert_empty computer.total_shots
  end

  def test_randomize_shot_returns_cell_on_grid
    board = Board.new
    computer = Computer.new
    random_shot1 = computer.randomize_shot(board)
    random_shot2 = computer.randomize_shot(board)
    included_on_grid1 = board.grid.include?(random_shot1)
    included_on_grid2 = board.grid.include?(random_shot2)
    assert included_on_grid1
    assert included_on_grid2
  end

  def test_announce_shot_does_announce
    computer = Computer.new
    computer.announce_shot('A4')
    say = "The enemy fired at A4.\n"
    assert_output(say) {computer.announce_shot('A4')}
  end
end
