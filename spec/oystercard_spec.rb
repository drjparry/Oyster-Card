require "make_oystercard.rb"
describe OysterCard do

  it "Balance = 0" do
    expect(subject.balance).to eq 0
  end
  it "gets topped up "do
    subject.top_up(30)
    expect(subject.balance).to eq 30
  end
  it "fails for a top-up more than 50" do
    subject.top_up(50)
    expect{subject.top_up(1)}.to raise_error "Max reached which is #{OysterCard::LIMIT}"
  end
end
