require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  it "It has a default balance of 0" do
	 oystercard.balance
	 expect(oystercard.balance).to eq 0
  end

  it 'Allows a user to top up the balance' do
    expect{subject.top_up 10}.to change{ subject.balance }.by 10

  end

  it "It has a maximum limit of £90" do
    oystercard.top_up(90)
    message = "Maximum limit of #{Oystercard::MAX_LIMIT} reached"
    expect{oystercard.top_up 1}.to raise_error message
  end


  it 'Allows users to touch in and out' do
    oystercard.top_up(90)
    oystercard.touch_in(Location.new)
    oystercard.in_journey?
    oystercard.touch_out(Location.new)
    expect(oystercard.in_journey?).to be false
  end

  it "Tests that you need a minimum amount for a single jouney" do
    message = "insufficient funds"
    expect{oystercard.touch_in(Location.new)}.to raise_error message
  end

  it "It deducts money when you touch out" do
    oystercard.top_up(20)
    oystercard.touch_in(Location.new)
    expect{oystercard.touch_out(Location.new)}.to change {oystercard.balance}.by(-Oystercard::SINGLE_JOURNEY)
  end

  it 'Knows where the user has travelled from' do
    oystercard.top_up(20)
    location = Location.new
    oystercard.touch_in(location)
    expect(oystercard.entry_location).to eq (location)
  end

  it 'Resets entry Location.new to nil when touched out' do
    oystercard.top_up(20)
    oystercard.touch_in(Location.new)
    oystercard.touch_out(Location.new)
    expect(oystercard.entry_location).to eq nil
  end

  it "sees all of the users previous trips" do
    oystercard.top_up(20)
    location1=Location.new
    location3 =Location.new
    oystercard.touch_in(location1)
    oystercard.touch_out(location3)
    expect(oystercard.history).to eq ({"journey"=>[location1, location3]})
  end

  #In order to know how far I have travelled
  #As a customer
  #I want to know what zone a station is in
  it 'allows a user to know what station he\'s in' do
    oystercard = Oystercard.new
    Station = Struct.new :zone
    station = Station.new(1)
    oystercard.top_up(20)
    oystercard.touch_in(station)
    expect(oystercard.where).to eq 1
  end
end
