require_relative 'cell'

class Board

  DEFAULT_SIDE_LENGTH = 10

  attr_reader :grid, :length, :cell, :ships

  def initialize(cell)
    @grid = []
    @length = DEFAULT_SIDE_LENGTH
    @cell = cell.new
    @ships = []
    create_grid(cell)
  end

  def receive_ship(ship, stern_cell, direction)
    coords = cell_coordinates(ship.size, stern_cell, direction)
    fail "Outside boundaries" if outside_boundaries(coords) == true
    fail "Overlaps with other ship" if overlap(coords) == true;
    set_cells_to_ship(coords)
    save_ship(ship, coords)
  end

  def save_ship(ship, coords)
    fail "Five ships have been added" if @ships.length >= 6
    fail "That type of ship has already been added" if @ships.map {|ship| ship.type}.any? {|x| x == ship.type}
    @ships.push(ship)
    ship.update_coords(coords)
  end

  def cell_coordinates(size, stern_cell, direction)
    coordinates = []
    size.times {coordinates.push(stern_cell)}
    return east(coordinates) if direction.downcase == 'east'
    return south(coordinates) if direction.downcase == 'south'
    return north(coordinates) if direction.downcase == 'north'
    return west(coordinates) if direction.downcase == 'west'
  end

  def outside_boundaries(ship_coordinates)
    ship_coordinates.flatten.any? {|i| i < 0 || i > 9}
  end

  def overlap(ship_coordinates)
    ship_coordinates.map {|coord| @grid[coord.first][coord.last].content}.any? {|x| x == :ship}
  end

  def set_cells_to_ship(ship_coordinates)
    ship_coordinates.each {|coord| @grid[coord.first][coord.last].content = :ship}
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
