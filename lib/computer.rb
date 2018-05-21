class Computer
  attr_reader :total_shots

  def initialize
    @total_shots = []
  end

  def randomize_shot(board)
    loop do
    shot = board.grid.keys.sample
      if @total_shots.include?(shot)
      else
        @total_shots << shot
        break
      end
    end
    return shot
  end

end
