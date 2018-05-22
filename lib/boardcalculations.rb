require './lib/text'

module BoardCalculations
  include Text
  def check_colliding(cells_for_3ship, cells_for_2ship)
    cells_for_2ship.any? do |cell|
      cells_for_3ship.include?(cell)
    end
  end

  def check_hits(shot, grid)
    if grid[shot] == '3' || grid[shot] == '2'
      grid[shot] = 'H'
      @opposing_shots[shot] = 'H'
      puts hit
    else
      grid[shot] = 'M'
      @opposing_shots[shot] = 'M'
      puts miss
    end
  end

  def count_hits(opposing_shots)
    hits = opposing_shots.values.count do |shots|
      shots == 'H'
    end
    return hits
  end

  def check_for_sunken_3ship(sunk_flag, grid)
    sunk_3ship = grid.values.none? do |value|
      value == '3'
    end
    if sunk_flag == false && sunk_3ship == true
      puts sunk_the_3ship
      return true
    elsif sunk_flag == true && sunk_3ship == true
      return true
    else
      return false
    end
  end

  def check_for_sunken_2ship(sunk_flag, grid)
    sunk_2ship = grid.values.none? do |value|
      value == '2'
    end
    if sunk_flag == false && sunk_2ship == true
      puts sunk_the_2ship
      return true
    elsif sunk_flag == true && sunk_2ship == true
      return true
    else
      return false
    end
  end

  def check_for_win(hits)
    if hits == 5
      return true
    else
      false
    end
  end

  def time_check(start, finish)
    timetocomplete = finish - start
    @finish_min = (timetocomplete / 60).to_i
    @finish_sec = (timetocomplete % 60).to_i
  end
end
