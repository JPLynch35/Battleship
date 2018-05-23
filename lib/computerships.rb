module ComputerShips
  def create_3ship(board)
    first_cell = first_cell_for_ship(board)
    build_dir = find_build_direction(board, first_cell)
    second_cell = next_cell_for_ship(first_cell, build_dir)
    third_cell = next_cell_for_ship(second_cell, build_dir)
    [first_cell, second_cell, third_cell]
  end

  def create_2ship(board, cells_for_3ship)
    cells_for_2ship = []
    loop do
      first_cell = first_cell_for_ship(board)
      build_dir = find_build_direction(board, first_cell)
      second_cell = next_cell_for_ship(first_cell, build_dir)
      cells_for_2ship = [first_cell, second_cell]
      conflict = board.colliding?(cells_for_3ship, cells_for_2ship)
      if conflict == false
        break
      end
    end
    return cells_for_2ship
  end

  def first_cell_for_ship(board)
    board_keys = board.grid.keys
    board_keys.sample
  end

  def find_build_direction(board, first_cell)
    build_dir_array = board.grid_rules_3ship[first_cell]
    build_dir_array.sample
  end

  def next_cell_for_ship(current_cell, build_dir)
    if build_dir == 'u'
      build_up_cell(current_cell)
    elsif build_dir == 'd'
      build_down_cell(current_cell)
    elsif build_dir == 'l'
      build_left_cell(current_cell)
    elsif build_dir == 'r'
      build_right_cell(current_cell)
    end
  end

  def build_up_cell(current_cell)
    grid_letters = ['A', 'B', 'C', 'D']
    letter_index = grid_letters.index(current_cell[0])
    next_cell_letter = grid_letters[letter_index - 1]
    return next_cell_letter + current_cell[1]
  end

  def build_down_cell(current_cell)
    next_cell_letter = current_cell[0].next
    return next_cell_letter + current_cell[1]
  end

  def build_left_cell(current_cell)
    next_cell_number = current_cell[1].to_i - 1
    return current_cell[0] + next_cell_number.to_s
  end

  def build_right_cell(current_cell)
    next_cell_number = current_cell[1].to_i + 1
    return current_cell[0] + next_cell_number.to_s
  end
end
