class Ship

attr_reader :type, :size, :hit_count

  def initialize(type)
    @type = type
    @size
    @hit_count = 0
    ship_size(type)
  end

  def hit
    @hit_count += 1
  end

  private

  def ship_size(type)
    battleships = {:carrier => 5, :destroyer => 4, :gunboat => 3, :submarine => 2, :minesweeper => 1}
    @size = battleships[type]
  end


end
