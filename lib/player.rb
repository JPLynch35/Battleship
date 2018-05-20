class Player

  def initialize
    @total_shots = []
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
      valid_1 = p_check_2ship_is_possible(board, p_endpoints_for_2ship)
      valid_2 = p_check_2ship_issues(board, p_endpoints_for_2ship)
      if valid_1 == true && valid_2 == true
        break
      end
    end
    first_cell = p_endpoints_for_2ship[0] + p_endpoints_for_2ship[1]
    second_cell = p_endpoints_for_2ship[-2] + p_endpoints_for_2ship[-1]
    return [first_cell, second_cell]
  end

  def input_3ship(board, p_endpoints_for_2ship)
    puts player_3ship_prompt
    p_endpoints_for_3ship = ""
    p_cells_for_3ship = ""
    loop do
      p_endpoints_for_3ship = gets.chomp.upcase
      p_cells_for_3ship = p_calculate_3ship_second_cell(p_endpoints_for_3ship)
      valid_1 = p_check_3ship_is_possible(board, p_cells_for_3ship)
      valid_2 = p_check_3ship_issues(board, p_endpoints_for_3ship, p_endpoints_for_2ship)
      if valid_1 == true && valid_2 == true
        break
      end
    end
    return p_cells_for_3ship
  end

  def input_shot(board, shots_fired)
    loop do
    shot = gets.chomp
      if board.grid.has_key?(shot) == false
        puts shot_not_on_grid
      elsif shots_fired.include?(shot)
        puts already_shot
      else
        shots_fired << shot
        puts valid_shot
        break
      end
    end
  end
end
