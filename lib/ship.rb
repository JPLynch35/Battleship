module Ship

  def create_3ship(board)
    first_cell = first_cell_for_ship(board)
    build_dir = find_build_direction(board, first_cell)
    second_cell = next_cell_for_ship(first_cell, build_dir)
    third_cell = next_cell_for_ship(second_cell, build_dir)
    [first_cell, second_cell, third_cell]
  end

  def first_cell_for_ship(board)
    board_keys = board.base.keys
    start_cell = board_keys.sample
  end

  def find_build_direction(board, first_cell)
    build_dir_array = board.grid_rules_3ship[first_cell]
    build_dir_array.sample
  end

  def next_cell_for_ship(current_cell, build_dir)
    grid_letters = ['A', 'B', 'C', 'D']
    if build_dir == 'u'
      letter_index = grid_letters.index(second_cell)
      second_cell_letter = grid_letters(letter_index - 1)
      return second_cell_letter + current_cell[1]
    elsif build_dir == 'd'
      second_cell_letter = current_cell[0].next
      return second_cell_letter + current_cell[1]
    elsif build_dir == 'l'
      second_cell_number = current_cell[1] - 1
      return current_cell[0] + second_cell_number
    elsif build_dir == 'r'
      second_cell_number = current_cell[1] + 1
      return first_cell[0] + second_cell_number
    end
  end


end
