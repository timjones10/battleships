require 'board'

describe 'board' do
    side_length = 10
    board = Board.new (side_length)

  it 'is initialized with a grid property set to an empty array' do
    expect(board.grid).to be_instance_of(Array)
  end

  it 'is initialized with a default side_length' do
    expect(board.length).not_to be nil
  end

end
