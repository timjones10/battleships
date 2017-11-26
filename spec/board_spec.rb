require 'board'
require 'cell'

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


end
