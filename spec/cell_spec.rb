require 'cell'

describe 'cell' do

  cell = Cell.new

  it 'is initialised with content set to default' do
    expect(cell.content).to eq(:sea)
  end

  it 'it\'s content value can be changed' do
    cell.content = :ship
    expect(cell.content).to eq (:ship)
  end

end
