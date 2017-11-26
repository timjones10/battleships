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
  return cell_coordinates_east(size, stern_cell, direction) if direction.downcase == 'east'
  return cell_coordinates_south(size, stern_cell, direction) if direction.downcase == 'south'
  end

  private

  def create_grid(cell)
    nested_array = []
    DEFAULT_SIDE_LENGTH.times {nested_array.push(cell.new)}
    DEFAULT_SIDE_LENGTH.times {@grid.push(nested_array)}
  end

  def cell_coordinates_east(size, stern_cell, direction)
    coordinates = []
    size.times {coordinates.push(stern_cell)}
    coordinates.each_with_index.map {|x,i| [x.first, x.last + (i)]}
  end

  def cell_coordinates_south(size, stern_cell, direction)
    coordinates = []
    size.times {coordinates.push(stern_cell)}
    coordinates.each_with_index.map {|x,i| [x.first + (i), x.last ]}
  end

end

puts @grid
