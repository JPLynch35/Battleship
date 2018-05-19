module Ship
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
      conflict = board.check_colliding(cells_for_3ship, cells_for_2ship)
      if conflict == false
        break
      end
    end
    return cells_for_2ship
  end

  def first_cell_for_ship(board)
    board_keys = board.grid.keys
    start_cell = board_keys.sample
  end

  def find_build_direction(board, first_cell)
    build_dir_array = board.grid_rules_3ship[first_cell]
    build_dir_array.sample
  end

  def next_cell_for_ship(current_cell, build_dir)
    grid_letters = ['A', 'B', 'C', 'D']
    if build_dir == 'u'
      letter_index = grid_letters.index(current_cell[0])
      next_cell_letter = grid_letters[letter_index - 1]
      return next_cell_letter + current_cell[1]
    elsif build_dir == 'd'
      next_cell_letter = current_cell[0].next
      return next_cell_letter + current_cell[1]
    elsif build_dir == 'l'
      next_cell_number = current_cell[1].to_i - 1
      return current_cell[0] + next_cell_number.to_s
    elsif build_dir == 'r'
      next_cell_number = current_cell[1].to_i + 1
      return current_cell[0] + next_cell_number.to_s
    end
  end

  def p_check_2ship_is_possible(board, endpoints)
    first_cell = endpoints.chars[0]+endpoints.chars[1]
    second_cell = endpoints.chars[-2]+endpoints.chars[-1]
    possible_moves = board.grid_rules_2ship[first_cell]
    possible_moves.any? do |move|
      second_cell == next_cell_for_ship(first_cell, move)
    end
  end

  def check_2ship_issues_and_inform(board, endpoints)
    wrap = p_check_ship_wrap(board, endpoints)
    length = p_check_2ship_length(board, endpoints)
    diagonal = p_check_ship_diagonal(board, endpoints)
    valid = true
    if wrap == true
      puts ship_wrap_error
      valid = false
    elsif length == true
      puts ship_length_error
      valid = false
    elsif diagonal == true
      puts ship_diagonal_error
      valid = false
    end
    return valid
  end

  def p_check_ship_wrap(board, endpoints)
    test_1 = endpoints.chars.include?("A") && endpoints.chars.include?("D")
    test_2 = endpoints.chars.include?("1") && endpoints.chars.include?("4")
    if test_1 || test_2
      true
    else
      false
    end
  end

  def p_check_2ship_length(board, endpoints)
    grid_letters = ['A', 'B', 'C', 'D']
    if endpoints.chars[0] == endpoints.chars[-2]
      endpoints.chars[1].to_i - endpoints.chars[-1].to_i != -1 || 1
    elsif endpoints.chars[1] == endpoints.chars[-1]
      grid_letters.index(endpoints.chars[0]) - grid_letters.index(endpoints.chars[-2]) != -1 || 1
    end
  end

  def p_check_ship_diagonal(board, endpoints)
    if endpoints.chars[0] == endpoints.chars[-2]
      false
    elsif endpoints.chars[1] == endpoints.chars[-1]
      false
    else
      true
    end
  end

end
