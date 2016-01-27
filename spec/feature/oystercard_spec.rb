require 'oystercard.rb'

# In order to know where I have been
# As a customer
# I want to see to all my previous trips

describe 'User stories' do
  let(:station) {double :station}
  it 'shows all previous trips' do
    oystercard = OysterCard.new
    oystercard.top_up(20)
    oystercard.touch_in(station)
    oystercard.touch_out(station)
    expect(oystercard.full_history).to eq ({oystercard.time=>[station, station]})
  end
end
