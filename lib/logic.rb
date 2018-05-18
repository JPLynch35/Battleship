class Logic

  def initialize
  end

  def game_menu_options(text)
    continue = false
    while continue == false
      text.welcome_screen
      continue = game_menu_choice(text)
    end
  end

  def game_menu_choice(text)
    user_menu_input = gets.chomp.downcase
    if user_menu_input == "p" || user_menu_input == "play"
      continue = true
    elsif user_menu_input == "i" || user_menu_input == "instructions"
      text.game_instructions
      continue = false
    elsif user_menu_input == "q" || user_menu_input == "quit"
      exit
    else
      continue = false
    end
  end

end
