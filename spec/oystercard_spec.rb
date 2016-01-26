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
    it 'gets deducted' do
      subject.deduct(10)
      expect(subject.balance).to eq 20
    end
  end

  describe 'journey' do
    it 'journey commences' do
      expect(subject).to_not be_in_journey
    end
    it 'taps-in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'taps-out' do
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
  end
end
