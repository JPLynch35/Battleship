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
    p_endpoints_for_2ship = ""
    loop do
      p_endpoints_for_2ship = gets.chomp.upcase
      valid = p_check_2ship_is_possible(board, p_endpoints_for_2ship)
      if valid == false
        check_2ship_issues_and_inform(board, p_endpoints_for_2ship)
      else
        break
      end
    end
    first_cell = p_endpoints_for_2ship[0] + p_endpoints_for_2ship[1]
    second_cell = p_endpoints_for_2ship[-2] + p_endpoints_for_2ship[-1]
    return [first_cell, second_cell]
  end

end
