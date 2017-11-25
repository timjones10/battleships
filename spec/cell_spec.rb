require 'cell'

describe 'cell' do

  cell = Cell.new

  it 'is initialised with content set to default' do
    expect(cell.content).to eq(:sea)
  end

end
