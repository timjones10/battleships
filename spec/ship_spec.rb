require 'ship'

describe 'ship' do

  it 'is initiated with a type' do
    ship = Ship.new(:carrier)
    expect(ship.type).to eq :carrier
  end

  it 'knows its size which is determined by its type' do
  ship = Ship.new(:carrier)
  expect(ship.size).to eq 5
  end

end
