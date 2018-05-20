module Text
  def welcome_screen
    "      Welcome to BATTLESHIP\n
      Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def game_instructions
      "       The purpose of the game is for the player to sink the computer's ships.
      Both sides will place two ships of length 2 and 3 on their game board. Each
      side will take turns firing on the other's grid, and return with a hit or
      miss. The game ends when one side successfully hits every grid cell containing
      an enemy ship."
  end

  def player_2ship_prompt
      "      I have laid out my ships on the grid. You now need to layout your
      two ships. The first is two units long and the second is three units long.
      The grid has A1 at the top left and D4 at the bottom right.\n
      Enter the squares for the two-unit ship (first and last):"
  end

  def player_3ship_prompt
      "Enter the squares for the three-unit ship (first and last):"
  end

  def ship_wrap_error
    "Your coordinates wrap the ship around the board.  Please input new coordinates."
  end

  def ship_length_error
    "Your coordinates don't match the size of the ship.  Please input new coordinates."
  end

  def ship_diagonal_error
    "Your coordinates do not indicate a horizontal or vertical placement.  Please input new coordinates."
  end

  def ship_collision_error
    "Your coordinates indicate a ship collision.  Please input new coordinates."
  end
end
