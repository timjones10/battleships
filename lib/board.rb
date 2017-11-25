class Board

  DEFAULT_SIDE_LENGTH = 10

  attr_reader :grid, :length

  def initialize(side_length = DEFAULT_SIDE_LENGTH)
    @grid = []
    @length = side_length
    create_grid
  end


  private

  def create_grid
    DEFAULT_SIDE_LENGTH.times {@grid.push([])}
  end

end
