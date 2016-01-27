require 'station'

describe Station do
  subject(:station) {described_class.new("Liverpool Street", 1)}
  
  it 'can access its name' do
    expect(station.name).to eq "Liverpool Street"
  end
  
  it 'can access its zone' do
    expect(station.zone).to eq 1
  end
end