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

  def cell_coordinates(size, stern_cell, direction)
    coordinates = []
    size.times {coordinates.push(stern_cell)}
    return east(coordinates) if direction.downcase == 'east'
    return south(coordinates) if direction.downcase == 'south'
    return north(coordinates) if direction.downcase == 'north'
    return west(coordinates) if direction.downcase == 'west'
  end

  def outside_boundaries?(ship_coordinates)
    ship_coordinates.flatten.any? {|i| i > 0 || i < 9}
  end

  private

  def create_grid(cell)
    nested_array = []
    DEFAULT_SIDE_LENGTH.times {nested_array.push(cell.new)}
    DEFAULT_SIDE_LENGTH.times {@grid.push(nested_array)}
  end

  def east(coordinates)
    coordinates.each_with_index.map {|x,i| [x.first, x.last + (i)]}
  end

  def south(coordinates)
    coordinates.each_with_index.map {|x,i| [x.first + (i), x.last ]}
  end

  def north(coordinates)
    coordinates.each_with_index.map {|x,i| [x.first - (i), x.last ]}
  end

  def west(coordinates)
    coordinates.each_with_index.map {|x,i| [x.first, x.last - (i) ]}
  end

end

puts @grid
