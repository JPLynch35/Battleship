require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_does_it_exist
    player = Player.new
    assert_instance_of Player, player
  end

  def test_player_class_attribute
    player = Player.new
    assert_empty player.total_shots
  end

  # def test_menu_choice_plays
  #   player = Player.new
  #   user_menu_input = 'P'
  #   player_
  # end

end
