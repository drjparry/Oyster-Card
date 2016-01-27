require 'oystercard.rb'
require 'station'
require 'journey'
# In order to know where I have been
# As a customer
# I want to see to all my previous trips

describe 'User stories' do
  let(:station) {Station.new("liverpool street", 1)}
  let(:oystercard) {OysterCard.new}
  it 'shows all previous trips' do
    oystercard = OysterCard.new
    oystercard.top_up(20)
    oystercard.touch_in(station)
    oystercard.touch_out(station)
    expect(oystercard.full_history).to eq ({oystercard.time=>[station, station]})
  end

#  In order to know how far I have travelled
#  As a customer
#  I want to know what zone a station is in
  it 'knows what zone a station is in' do
    oystercard = OysterCard.new
    station = Station.new("liverpool street", 1)

    expect(station[:zone]).to eq 1
  end

#   In order to be charged correctly
#   As a customer
#   I need a penalty charge deducted if I fail to touch in or out

  it 'deducts a penalty charge if user fails to touch in or out' do
    oystercard.top_up(50)
    oystercard.touch_in(station)
    message = "Penalty charge deducted: You forgot to touch out!"
    expect{oystercard.touch_in(station)}.to raise_error message
  end

  it 'checks whether a journey is complete' do
    oystercard = OysterCard.new
    station = Station.new
    oystercard.top_up(50)
    oystercard.touch_in(station)
    expect(oystercard.touch_out(station)).to eq "journey complete"
  end

end
