class Ship

attr_reader :type, :size, :hit_count, :sunk, :coords

  def initialize(type)
    @type = type
    @size
    @hit_count = 0
    @sunk = false
    @coords = []
    ship_size(type)
  end

  def hit
    @hit_count += 1
    @sunk = true if hit_count == size
  end

  private

  def ship_size(type)
    battleships = {:carrier => 5, :destroyer => 4, :gunboat => 3, :submarine => 2, :minesweeper => 1}
    @size = battleships[type]
  end


end
