module Ship_Validator
  def p_check_2ship_is_possible(board, endpoints)
    first_cell = endpoints.chars[0]+endpoints.chars[1]
    second_cell = endpoints.chars[-2]+endpoints.chars[-1]
    possible_moves = board.grid_rules_2ship[first_cell]
    possible_moves.any? do |move|
      second_cell == next_cell_for_ship(first_cell, move)
    end
  end

  def p_check_2ship_issues(board, endpoints)
    wrap = p_check_ship_wrap(endpoints)
    length = p_check_2ship_length(board, endpoints)
    diagonal = p_check_ship_diagonal(board, endpoints)
    valid = true
    if wrap == true
      puts ship_wrap_error
      valid = false
    elsif diagonal == true
      puts ship_diagonal_error
      valid = false
    elsif length == true
      puts ship_length_error
      valid = false
    end
    return valid
  end

  def p_check_2ship_length(board, endpoints)
    grid_letters = ['A', 'B', 'C', 'D']
    if endpoints.chars[0] == endpoints.chars[-2]
      endpoints.chars[1].to_i - endpoints.chars[-1].to_i != -1 || 1
    elsif endpoints.chars[1] == endpoints.chars[-1]
      grid_letters.index(endpoints.chars[0]) - grid_letters.index(endpoints.chars[-2]) != -1 || 1
    end
  end

  def p_check_ship_wrap(endpoints)
    test_1 = endpoints.chars.include?("A") && endpoints.chars.include?("D")
    test_2 = endpoints.chars.include?("1") && endpoints.chars.include?("4")
    if test_1 || test_2
      true
    else
      false
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

  def p_check_3ship_is_possible(board, p_cells_for_3ship)
    first_cell = p_cells_for_3ship[0]
    second_cell = p_cells_for_3ship[1]
    possible_moves = board.grid_rules_3ship[first_cell]
    possible_moves.any? do |move|
      second_cell == next_cell_for_ship(first_cell, move)
    end
  end

  def p_calculate_3ship_second_cell(endpoints)
    first_cell = endpoints.chars[0] + endpoints.chars[1]
    third_cell = endpoints.chars[-2] + endpoints.chars[-1]
    largest_num = [first_cell[1].to_i, third_cell[1].to_i].max
    letters = ['A', 'B', 'C', 'D']
    highest_index = [letters.index(first_cell[0]), letters.index(third_cell[0])].max
    if first_cell[0] == third_cell[0]
      second_cell = first_cell[0] + (largest_num - 1).to_s
    elsif first_cell[1] == third_cell[1]
      second_cell = letters[highest_index - 1] + first_cell[1]
    end
    return [first_cell, second_cell, third_cell]
  end

  def p_check_3ship_issues(board, endpoints, endpoints_2ship)
    cells_for_3ship = p_calculate_3ship_second_cell(endpoints)
    length = p_check_3ship_length(board, endpoints)
    diagonal = p_check_ship_diagonal(board, endpoints)
    collision = board.check_colliding(cells_for_3ship, endpoints_2ship)
    valid = true
    if diagonal == true
      puts ship_diagonal_error
      valid = false
    elsif length == false
      puts ship_length_error
      valid = false
    elsif collision == true
      puts ship_collision_error
      valid = false
    end
    return valid
  end

  def p_check_3ship_length(board, endpoints)
    grid_letters = ['A', 'B', 'C', 'D']
    number_diff = endpoints.chars[1].to_i - endpoints.chars[-1].to_i
    letter_index_diff = grid_letters.index(endpoints.chars[0]) - grid_letters.index(endpoints.chars[-2])
    if endpoints.chars[0] == endpoints.chars[-2]
      number_diff.abs == 2
    elsif endpoints.chars[1] == endpoints.chars[-1]
      letter_index_diff.abs == 2
    end
  end
end
