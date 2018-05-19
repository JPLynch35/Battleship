module Text
  def welcome_screen
    "Welcome to BATTLESHIP\n
      Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def game_instructions
      "The purpose of the game is for the player to sink to computer's ships. Both
      sides will place two ships of length 2 and 3 on their game board. Each side
      will take turns guessing the grid of eachother's ships, and return with a hit
      or miss.  The game ends when one side successfully hits every grid cell
      containing an enemy ship."
  end

  def player_2ship_prompt
      "I have laid out my ships on the grid.
      You now need to layout your two ships.
      The first is two units long and the
      second is three units long.
      The grid has A1 at the top left and D4 at the bottom right.\n
      Enter the squares for the two-unit ship:"
  end

  def ship_wrap_error
    "Your coordinates wrap the ship around the board.  Please input new coordinates."
  end

  def ship_length_error
    "Your coordinates exceed the size of the ship.  Please input new coordinates."
  end
end
