class Board
  attr_reader :grid,
              :grid_rules_3ship,
              :grid_rules_2ship

  def initialize
    @grid = {
      'A1' => ' ', 'A2' => ' ', 'A3' => ' ', 'A4' => ' ',
      'B1' => ' ', 'B2' => ' ', 'B3' => ' ', 'B4' => ' ',
      'C1' => ' ', 'C2' => ' ', 'C3' => ' ', 'C4' => ' ',
      'D1' => ' ', 'D2' => ' ', 'D3' => ' ', 'D4' => ' '
    }
    @grid_rules_3ship = {
      'A1' => ['d','r'], 'A2' => ['d','r'], 'A3' => ['d','l'], 'A4' => ['d','l'],
      'B1' => ['d','r'], 'B2' => ['d','r'], 'B3' => ['d','l'], 'B4' => ['d','l'],
      'C1' => ['u','r'], 'C2' => ['u','r'], 'C3' => ['u','l'], 'C4' => ['u','l'],
      'D1' => ['u','r'], 'D2' => ['u','r'], 'D3' => ['u','l'], 'D4' => ['u','l']
    }
    @grid_rules_2ship = {
      'A1' => ['d','r'], 'A2' => ['d','r','l'], 'A3' => ['d','l','r'], 'A4' => ['d','l'],
      'B1' => ['u','d','r'], 'B2' => ['u','d','r','l'], 'B3' => ['u','d','r','l'], 'B4' => ['u','d','l'],
      'C1' => ['u','d','r'], 'C2' => ['u','d','r','l'], 'C3' => ['u','d','r','l'], 'C4' => ['u','d','l'],
      'D1' => ['u','r'], 'D2' => ['u','l','r'], 'D3' => ['u','l','r'], 'D4' => ['u','l']
    }
  end

  def game_board(board)
    puts "==========="
    puts ". 1 2 3 4"
    puts "A #{board.grid['A1']} #{board.grid['A2']} #{board.grid['A3']} #{board.grid['A4']}"
    puts "B #{board.grid['B1']} #{board.grid['B2']} #{board.grid['B3']} #{board.grid['B4']}"
    puts "C #{board.grid['C1']} #{board.grid['C2']} #{board.grid['C3']} #{board.grid['C4']}"
    puts "D #{board.grid['D1']} #{board.grid['D2']} #{board.grid['D3']} #{board.grid['D4']}"
    puts "==========="
  end

  def set_ship(board, all_ship_cells)
    all_ship_cells.each do |cell|
      board.grid[cell] = "S"
    end
  end

  def check_colliding(cells_for_3ship, cells_for_2ship)
    cells_for_2ship.any? do |cell|
      cells_for_3ship.include?(cell)
    end
  end
end
