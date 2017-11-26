require 'board'
require 'cell'
require 'ship'

describe 'board' do
    board = Board.new(Cell)

  it 'is initialized with a grid property set to an empty array' do
    expect(board.grid).to be_instance_of(Array)
  end

  it 'is initialized with a default side_length' do
    expect(board.length).not_to be nil
  end

  it 'generates nested arrays within the Grid array dependent on side_length' do
    expect(board.grid.length).to eq(board.length)
  end

  it 'is initialized with a cell which is default set to a cell object' do
    expect(board.cell).to be_instance_of(Cell)
  end

  it 'adds cells to the nested arrays within grid according to the side length' do
    expect(board.grid[0][0]).to be_instance_of(Cell)
  end

  it 'generates cell coordinates for a ship from ship_length, coordinates and direction' do
    expect(board.cell_coordinates(5, [0,0], 'east')).to eq ([[0,0], [0,1], [0,2], [0,3], [0,4]])
  end

  it 'generates cell coordinates for a ship from ship_length, coordinates and direction' do
    expect(board.cell_coordinates(5, [0,0], 'south')).to eq ([[0,0], [1,0], [2,0], [3,0], [4,0]])
  end

  it 'generates cell coordinates for a ship from ship_length, coordinates and direction' do
    expect(board.cell_coordinates(5, [9,0], 'north')).to eq ([[9,0], [8,0], [7,0], [6,0], [5,0]])
  end

  it 'generates cell coordinates for a ship from ship_length, coordinates and direction' do
    expect(board.cell_coordinates(5, [9,9], 'west')).to eq ([[9,9], [9,8], [9,7], [9,6], [9,5]])
  end

  it 'has an outside_boundaries? method which determines that a ship does not overlap the board' do
    expect(board.outside_boundaries(board.cell_coordinates(5, [0,0], 'west'))).to be true
  end

  it 'sets the contents of cells to ship when a ship is placed' do
    board.cell_coordinates(5, [0,0], 'east')
    board.set_cells_to_ship(board.cell_coordinates(5, [0,0], 'east'))
    expect(board.grid[0][0].content).to eq :ship
  end

  it 'receives a ship' do
    board = Board.new(Cell)
    ship = Ship.new(:carrier)
    board.receive_ship(ship, [0,0], 'east')
    expect(board.grid[0][0].content).to eq :ship
  end

  it 'has a save_ship method which checks the ship and adds it to a ships array' do
    board = Board.new(Cell)
    ship = Ship.new(:carrier)
    coords = [[0,0],[0,1],[0,2],[0,3],[0,4]]
    board.save_ship(ship, coords)
    expect(board.ships.length).to eq 1
  end

  it 'the save_ship method requires the ship to update its coords if ship is placed successfully' do
    board = Board.new(Cell)
    ship = Ship.new(:carrier)
    board.receive_ship(ship, [0,0], 'east')
    expect(board.ships[0].coords).to eq ([[0,0],[0,1],[0,2],[0,3],[0,4]])
  end

end

describe 'board' do
  let(:cell) {double :cell, content: :ship}
  let(:cell_class){double :cell_class, :new => cell}

  it 'has an overlap method which checks that the ship will not overlap another ship' do
    board = Board.new(cell_class)
    puts board.grid[0][0].content
    expect(board.overlap(board.cell_coordinates(5, [0,0], 'east'))).to be true
  end
end
