class Player

  def initialize
    @rounds = 0
  end

  def menu_choice
    loop do
      user_menu_input = gets.chomp.upcase
      if user_menu_input == "P" || user_menu_input == "PLAY"
        break
      elsif user_menu_input == "I" || user_menu_input == "INSTRUCTIONS"
        puts game_instructions
      elsif user_menu_input == "Q" || user_menu_input == "QUIT"
        exit
      end
    end
  end

  def input_2ship(board)
    puts player_2ship_prompt
    loop do
      p_endpoints_for_2ship = gets.chomp.upcase
      valid = p_check_2ship_is_possible(p_board, p_endpoints_for_2ship)
      if valid == false
        check_2ship_issues_and_inform(p_board, p_endpoints_for_2ship)
      else
        break
      end
    end
    return p_endpoints_for_2ship
  end

end
