require './test/test_helper'
require './lib/logic'
require './lib/text'

class LogicTest < Minitest::Test

  def test_player_menu_play
    text = Text.new
    logic = Logic.new
    menu_play_letter = logic.player_menu_choice("p", text)
    menu_play_word = logic.player_menu_choice("play", text)

    assert menu_play_letter
    assert menu_play_word
  end

  def test_player_menu_instructions
    text = Text.new
    logic = Logic.new
    menu_play_letter = logic.player_menu_choice("i", text)
    menu_play_word = logic.player_menu_choice("instructions", text)

    refute menu_play_letter
    refute menu_play_word
  end
end
