class Board
  attr_reader :base,
              :current,
              :grid_rules_3ship,
              :grid_rules_2ship

  def initialize
    @grid = {
      'A1' => '', 'A2' => '', 'A3' => '', 'A4' => '',
      'B1' => '', 'B2' => '', 'B3' => '', 'B4' => '',
      'C1' => '', 'C2' => '', 'C3' => '', 'C4' => '',
      'D1' => '', 'D2' => '', 'D3' => '', 'D4' => ''
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
    @game_board =
      puts "==========="
      puts ". 1 2 3 4"
      puts "A #{@base['A1']} #{@base['A2']} #{@base['A3']} #{@base['A4']}"
      puts "B #{@base['B1']} #{@base['B2']} #{@base['B3']} #{@base['B4']}"
      puts "C #{@base['C1']} #{@base['C2']} #{@base['C3']} #{@base['C4']}"
      puts "D #{@base['D1']} #{@base['D2']} #{@base['D3']} #{@base['D4']}"
      puts "==========="
  end

end
