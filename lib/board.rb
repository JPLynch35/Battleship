class Board
  attr_reader :current

  def initialize
    @base = {
      'A1' => '', 'A2' => '', 'A3' => '', 'A4' => '',
      'B1' => '', 'B2' => '', 'B3' => '', 'B4' => '',
      'C1' => '', 'C2' => '', 'C3' => '', 'C4' => '',
      'D1' => '', 'D2' => '', 'D3' => '', 'D4' => ''
    }
    @current =
      puts "==========="
      puts ". 1 2 3 4"
      puts "A #{@base['A1']} #{@base['A2']} #{@base['A3']} #{@base['A4']}"
      puts "B #{@base['B1']} #{@base['B2']} #{@base['B3']} #{@base['B4']}"
      puts "C #{@base['C1']} #{@base['C2']} #{@base['C3']} #{@base['C4']}"
      puts "D #{@base['D1']} #{@base['D2']} #{@base['D3']} #{@base['D4']}"
      puts "==========="
  end



end
