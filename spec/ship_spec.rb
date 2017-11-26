require 'ship'

describe 'ship' do
  ship = Ship.new(:carrier)

  it 'is initiated with a type' do
    expect(ship.type).to eq :carrier
  end

  it 'knows its size which is determined by its type' do
  expect(ship.size).to eq 5
  end

  it 'can recieve a hit' do
    ship.hit
    expect(ship.hit_count).to eq 1
  end

  it 'is sunk when it has received the same number of hits as its size' do
    ship = Ship.new(:carrier)
    5.times {ship.hit}
    expect(ship.sunk).to eq true
  end

end
