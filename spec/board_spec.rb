require 'board'

describe 'board' do

    board = Board.new

  it 'is initialized with a grid property set to an empty array' do
    expect(board.grid).to be_instance_of(Array)
  end

end
