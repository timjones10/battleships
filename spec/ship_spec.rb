require 'ship'

describe 'ship' do

  it 'is initiated with a type' do
    ship = Ship.new(:carrier)
    expect(ship.type).to eq :carrier
  end

end
