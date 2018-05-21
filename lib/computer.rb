class Computer

  def initialize
    @total_shots = []
  end

  def randomize_shot(board)
    shot = ""
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
