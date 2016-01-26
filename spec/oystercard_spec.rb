require "make_oystercard.rb"
describe OysterCard do

  it "Balance = 0" do
    expect(subject.balance).to eq 0
  end
describe "#top_up"do
  it "tops up the card is empty"do
    subject.top_up(65)
    expect(subject.balance).to eq 65
  end
  it "tops up the card when the card has money"do
  subject.top_up(10)
  subject.top_up(20)
  expect(subject.balance).to eq 30
  end
it "has a maximum balance"do
  expect{ subject.top_up(OysterCard::MAX_BALANCE + 1) }.to raise_error "Amount exceeds the limit: #{OysterCard::MAX_BALANCE}"
end
end

end
