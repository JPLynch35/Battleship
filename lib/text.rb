class Text

  def game_menu_options
    continue = false
    while continue == false
    puts "Welcome to BATTLESHIP\n\n
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    user_menu_input = gets.chomp.downcase
    continue = game_menu_choice(user_menu_input)
    end
  end

  def game_menu_choice(user_menu_input)
    if user_menu_input == "p" || user_menu_input == "play"
      continue = true
    elsif user_menu_input == "i" || user_menu_input == "instructions"
      game_instructions
      continue = false
    elsif user_menu_input == "q" || user_menu_input == "quit"
      exit
    end
  end

  def game_instructions
    puts(
      "The purpose of the game is for the player to sink to computer's ships. Both
      sides will place two ships of length 2 and 3 on their game board. Each side
      will take turns guessing the grid of eachother's ships, and return with a hit
      or miss.  The game ends when one side successfully hits every grid cell
      containing an enemy ship."
    )
  end

  def player_ships_prompt
    puts(
      "I have laid out my ships on the grid.
      You now need to layout your two ships.
      The first is two units long and the
      second is three units long.
      The grid has A1 at the top left and D4 at the bottom right.\n\n
      Enter the squares for the two-unit ship:"
    )
  end

end
