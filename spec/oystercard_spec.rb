require "make_oystercard.rb"
describe OysterCard do

  it "Balance = 0" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    before do
      subject.top_up(30)
    end
    it "gets topped up "do
    expect(subject.balance).to eq 30
  end
  it "fails for a top-up more than 50" do
    subject.top_up(20)
    expect{subject.top_up(1)}.to raise_error "Max reached which is #{OysterCard::LIMIT}"
  end
end

describe 'journey' do
  before do
    subject.top_up(10)
  end

  let(:station) {double(:station)}
  it 'journey commences' do
    expect(subject).to_not be_in_journey
  end
  context 'touch_in' do
    it 'card has at least £1' do
      subject.touch_out(station)
      expect{subject.touch_in(station)}.to raise_error "Insufficient balance #{OysterCard::MINIMUM}"
    end
    it 'taps-in' do
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end
    it 'has entry station' do
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
  end
  end
  context 'touch_out' do

    it 'taps-out' do
      subject.touch_out(station)
      expect(subject).to_not be_in_journey
    end
    it 'charges on touch_out' do
      expect{subject.touch_out(station)}.to change{subject.balance}.by(-10)

    end
    it 'forgets entry station' do
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.entry_station).to eq nil
    end

    it 'remembers exit station' do
      subject.touch_out(station)
      expect(subject.exit_station).to eq station
    end

    it 'records journey history' do
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.journey_history).to eq [station,station]
    end

    # it 'records journey set' do
    #   subject.journey_history
    # end
  end
end
end
