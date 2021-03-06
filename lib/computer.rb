require './lib/text'

class Computer
  include Text
  attr_reader :total_shots

  def initialize
    @total_shots = []
  end

  def randomize_shot(board)
    shot = ''
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

  def announce_shot(shot)
    puts enemy_shot_coord(shot)
  end
end
