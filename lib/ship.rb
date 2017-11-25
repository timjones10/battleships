class Ship

attr_reader :type, :size

  def initialize(type)
    @type = type
    @size
    ship_size(type)
  end

  private

  def ship_size(type)
    battleships = {:carrier => 5, :destroyer => 4, :gunboat => 3, :submarine => 2, :minesweeper => 1}
    @size = battleships[type]
  end


end
