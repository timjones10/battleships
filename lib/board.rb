class Board

  DEFAULT_SIDE_LENGTH = 10

  attr_reader :grid, :length, :cell

  def initialize(cell = Cell.new)
    @grid = []
    @length = DEFAULT_SIDE_LENGTH
    @cell = cell
    create_grid
  end


  private

  def create_grid
    DEFAULT_SIDE_LENGTH.times {@grid.push([])}
  end

end
