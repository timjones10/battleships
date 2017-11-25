require_relative 'cell'

class Board

  DEFAULT_SIDE_LENGTH = 10

  attr_reader :grid, :length, :cell

  def initialize(cell)
    @grid = []
    @length = DEFAULT_SIDE_LENGTH
    @cell = cell.new
    create_grid(cell)
  end


  private

  def create_grid(cell)
    nested_array = []
    DEFAULT_SIDE_LENGTH.times {nested_array.push(cell.new)}
    DEFAULT_SIDE_LENGTH.times {@grid.push(nested_array)}
  end

end

puts @grid
