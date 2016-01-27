require "oystercard.rb"
describe OysterCard do
  subject(:oystercard) {described_class.new}

  it "Balance = 0" do
    expect(oystercard.balance).to eq 0
  end

  describe "#top_up" do
    before do
      oystercard.top_up(30)
    end

    it "gets topped up "do
      expect(oystercard.balance).to eq 30
    end

    it "fails for a top-up more than 50" do
      oystercard.top_up(20)
      expect{oystercard.top_up(1)}.to raise_error "Max reached which is #{OysterCard::LIMIT}"
    end
  end

  describe 'journey' do
    let(:station) {double(:station)}
    before do
      oystercard.top_up(10)
    end

    it 'journey commences' do
      expect(oystercard).to_not be_in_journey
    end

    context 'touch_in' do
      it 'card has at least £1' do
        oystercard.touch_out(station)
        expect{oystercard.touch_in(station)}.to raise_error "Insufficient balance #{OysterCard::MINIMUM}"
      end

      it 'taps-in' do
        oystercard.touch_in(station)
        expect(oystercard).to be_in_journey
      end

      it 'has entry station' do
        oystercard.touch_in(station)
        expect(oystercard.entry_station).to eq station
      end
    end

    context 'touch_out' do

      it 'taps-out' do
        oystercard.touch_out(station)
        expect(oystercard).to_not be_in_journey
      end

      it 'charges on touch_out' do
        expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-10)
      end

      it 'remembers exit station' do
        oystercard.touch_out(station)
        expect(oystercard.exit_station).to eq station
      end

      it 'records journey history' do
        oystercard.touch_in(station)
        oystercard.touch_out(station)

        expect(oystercard.full_history).to eq ({oystercard.time=>[station, station]})
      end

    end
  end
end
