require './test/test_helper'
require './lib/text'

class TextTest < Minitest::Test
  include Text
  def test_welcome_screen_shows_text
    actual = welcome_screen
    expected = "      Welcome to BATTLESHIP\n
      Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal expected, actual
  end

  def test_game_instructions_shows_text
    actual = game_instructions
    expected = (
      "      The purpose of the game is for the player to sink the computer's ships.
      Both sides will place two ships of length 2 and 3 on their game board. Each
      side will take turns firing on the other's grid, and return with a hit or
      miss. The game ends when one side successfully hits every grid cell containing
      an enemy ship."
    )
    assert_equal expected, actual
  end

  def test_ship_coord_not_valid_shows_text
    actual = ship_coord_not_valid
    expected = "Entered ship coordinates are not valid.  Please input new coordinates."
    assert_equal expected, actual
  end

  def test_player_2ship_prompt_shows_text
    actual = player_2ship_prompt
    expected = (
      "      I have laid out my ships on the grid. You now need to layout your
      two ships. The first is two units long and the second is three units long.
      The grid has A1 at the top left and D4 at the bottom right.\n
      Enter the squares for the two-unit ship (first and last):"
    )
    assert_equal expected, actual
  end

  def test_player_3ship_prompt_shows_text
    actual = player_3ship_prompt
    expected = "Enter the squares for the three-unit ship (first and last):"
    assert_equal expected, actual
  end

  def test_ship_wrap_error_shows_text
    actual = ship_wrap_error
    expected = "Your coordinates wrap the ship around the board.  Please input new coordinates."
    assert_equal expected, actual
  end

  def test_ship_length_error_shows_text
    actual = ship_length_error
    expected = "Your coordinates don't match the size of the ship.  Please input new coordinates."
    assert_equal expected, actual
  end

  def test_ship_diagonal_error_shows_text
    actual = ship_diagonal_error
    expected = "Your coordinates do not indicate a horizontal or vertical placement.  Please input new coordinates."
    assert_equal expected, actual
  end

  def test_ship_collision_error_shows_text
    actual = ship_collision_error
    expected = "Your coordinates indicate a ship collision.  Please input new coordinates."
    assert_equal expected, actual
  end

  def test_fire_prompt_shows_text
    actual = fire_prompt
    expected = "Enter a coordinate to fire at."
    assert_equal expected, actual
  end

  def test_valid_shot_shows_text
    actual = valid_shot
    expected = "\nFIRE!"
    assert_equal expected, actual
  end

  def test_shot_not_on_grid_shows_text
    actual = shot_not_on_grid
    expected = "Entered coordinate is not valid.  Please input a new coordinate."
    assert_equal expected, actual
  end

  def test_already_shot_shows_text
    actual = already_shot
    expected = "You have already fired at that coordinate.  Please input a new coordinate"
    assert_equal expected, actual
  end

  def test_hit_shows_text
    actual = hit
    expected = "Hit!"
    assert_equal expected, actual
  end

  def test_miss_shows_text
    actual = miss
    expected = "Miss."
    assert_equal expected, actual
  end

  def test_p_turn_shows_text
    actual = p_turn
    expected = "\nYOUR TURN"
    assert_equal expected, actual
  end

  def test_c_turn_shows_text
    actual = c_turn
    expected = "\nENEMY'S TURN"
    assert_equal expected, actual
  end

  def test_enemy_shot_coord_shows_text
    actual = enemy_shot_coord('A1')
    expected = "The enemy fired at A1."
    assert_equal expected, actual
  end

  def test_press_enter_shows_text
    actual = press_enter
    expected = "Press enter to continue."
    assert_equal expected, actual
  end

  def test_sunk_the_2ship_shows_text
    actual = sunk_the_2ship
    expected = "The 2 unit ship has been sunk!"
    assert_equal expected, actual
  end

  def test_sunk_the_3ship_shows_text
    actual = sunk_the_3ship
    expected = "The 3 unit ship has been sunk!"
    assert_equal expected, actual
  end

  def test_win_shows_text
    actual = win
    expected = "Congratulations, you won!"
    assert_equal expected, actual
  end

  def test_lose_shows_text
    actual = lose
    expected = "You lost, better luck next time."
    assert_equal expected, actual
  end

  def test_metrics_to_finish_shows_text
    actual = metrics_to_finish(10, 1, 20)
    expected = "The game took 1 minute(s) and 20 seconds, with 10 shots, to complete."
    assert_equal expected, actual
  end

end
