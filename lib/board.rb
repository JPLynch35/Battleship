require './lib/boardcalculations'

class Board
  include BoardCalculations
  attr_reader :grid,
              :opposing_shots,
              :player_shots,
              :grid_rules_3ship,
              :grid_rules_2ship,
              :finish_min,
              :finish_sec

  def initialize
    @grid = {
      'A1' => ' ', 'A2' => ' ', 'A3' => ' ', 'A4' => ' ',
      'B1' => ' ', 'B2' => ' ', 'B3' => ' ', 'B4' => ' ',
      'C1' => ' ', 'C2' => ' ', 'C3' => ' ', 'C4' => ' ',
      'D1' => ' ', 'D2' => ' ', 'D3' => ' ', 'D4' => ' '
    }
    @opposing_shots = {
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

  def game_board
    puts "==========="
    puts ". 1 2 3 4"
    puts "A #{@grid['A1']} #{@grid['A2']} #{@grid['A3']} #{@grid['A4']}"
    puts "B #{@grid['B1']} #{@grid['B2']} #{@grid['B3']} #{@grid['B4']}"
    puts "C #{@grid['C1']} #{@grid['C2']} #{@grid['C3']} #{@grid['C4']}"
    puts "D #{@grid['D1']} #{@grid['D2']} #{@grid['D3']} #{@grid['D4']}"
    puts "==========="
  end

  def opposing_shots_board
    puts "Shot History"
    puts "==========="
    puts ". 1 2 3 4"
    puts "A #{@opposing_shots['A1']} #{@opposing_shots['A2']} #{@opposing_shots['A3']} #{@opposing_shots['A4']}"
    puts "B #{@opposing_shots['B1']} #{@opposing_shots['B2']} #{@opposing_shots['B3']} #{@opposing_shots['B4']}"
    puts "C #{@opposing_shots['C1']} #{@opposing_shots['C2']} #{@opposing_shots['C3']} #{@opposing_shots['C4']}"
    puts "D #{@opposing_shots['D1']} #{@opposing_shots['D2']} #{@opposing_shots['D3']} #{@opposing_shots['D4']}"
    puts "==========="
  end

  def set_ship(all_ship_cells)
    all_ship_cells.each do |cell|
      if all_ship_cells.length == 3
        @grid[cell] = "3"
      else
        @grid[cell] = "2"
      end
    end
  end
end
