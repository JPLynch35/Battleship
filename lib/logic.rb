require './lib/text'

module Logic
  include Text

  def initialize
  end

  def game_menu_options
    welcome_screen
    continue = false
    until continue == true
      user_menu_input = gets.chomp.downcase
      continue = player_menu_choice(user_menu_input)
    end
  end

  def player_menu_choice(user_menu_input)
    if user_menu_input == "p" || user_menu_input == "play"
      true
    elsif user_menu_input == "i" || user_menu_input == "instructions"
      game_instructions
      false
    elsif user_menu_input == "q" || user_menu_input == "quit"
      exit
    else
      false
    end
  end

  def set_2_ship(c_board)
    #is this treasure mapping?? ask Brian
    board_array_keys = c_board.base.keys
    shuffled_keys = board_array_keys.shuffle
    ship_2cell_start = shuffled_keys[0]
    cboard.set_ships(ship_2_cell_start, c_board)
    require 'pry'; binding.pry
  end

end
