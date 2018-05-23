class Player
  attr_reader :total_shots

  def initialize
    @total_shots = []
  end

  def menu_choice
    loop do
      user_menu_input = gets.chomp.upcase
      if user_menu_input == 'P' || user_menu_input == 'PLAY'
        break
      elsif user_menu_input == 'I' || user_menu_input == 'INSTRUCTIONS'
        puts game_instructions
      elsif user_menu_input == 'Q' || user_menu_input == 'QUIT'
        exit
      end
    end
  end

  def input_2ship(board)
    puts player_2ship_prompt
    p_endpoints_for_2ship = ''
    loop do
      p_endpoints_for_2ship = check_input_is_as_expected
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
    p_endpoints_for_3ship = ''
    p_3ship_cells = ''
    loop do
      p_endpoints_for_3ship = check_input_is_as_expected
      p_3ship_cells = p_calculate_3ship_second_cell(p_endpoints_for_3ship)
      valid_1 = p_check_3ship_is_possible(board, p_3ship_cells)
      valid_2 = p_check_3ship_issues(board, p_endpoints_for_3ship, p_endpoints_for_2ship)
      if valid_1 == true && valid_2 == true
        break
      end
    end
    return p_3ship_cells
  end

  def check_input_is_as_expected
    letters = ['A', 'B', 'C', 'D']
    nums = ['1', '2', '3', '4']
    ship = ''
    loop do
      ship = gets.chomp.upcase
      first_let = letters.include?(ship[0])
      second_let = letters.include?(ship[-2])
      first_num = nums.include?(ship[1])
      second_num = nums.include?(ship[-1])
      if first_let && second_let && first_num && second_num && ship.length == 4
        break
      else
        puts ship_coord_not_valid
      end
    end
    return ship
  end

  def input_shot(board, shots_fired)
    shot = ''
    loop do
    shot = gets.chomp.upcase
      if board.grid.has_key?(shot) == false
        puts shot_not_on_grid
      elsif @total_shots.include?(shot)
        puts already_shot
      else
        @total_shots << shot
        puts valid_shot
        break
      end
    end
    return shot
  end

  def press_enter_to_continue
    puts press_enter
    loop do
      waiting = gets
      break if waiting == "\n"
    end
  end
end
