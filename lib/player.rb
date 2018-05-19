class Player

  def initialize
    @rounds = 0
  end

  def menu_choice
    loop do
      user_menu_input = gets.chomp.downcase
      if user_menu_input == "p" || user_menu_input == "play"
        break
      elsif user_menu_input == "i" || user_menu_input == "instructions"
        game_instructions
      elsif user_menu_input == "q" || user_menu_input == "quit"
        exit
      end
    end
  end

end
