require 'oystercard'

  describe OysterCard do 

	subject(:card) { described_class.new }	
  
  
  it 'stores the history of journeys' do
    card.top_up 40
    card.touch_in "King's Cross"
    card.touch_out "Acton Town"
    card.touch_in "Finsbury Park"
    card.touch_out "Acton Town"
    expect(card.history).to eq [{"King's Cross" => "Acton Town"}, {"Finsbury Park" => "Acton Town"}]
  end
  
  it 'initial history is empty' do
    expect(card.history).to eq []
  end

  describe '#balance' do 
    
		it 'displays a balance of zero when card is new' do 
		
    expect(card.balance).to eq 0

		end
   end

	describe '#top_up' do 

  	it 'allows user to top up' do
		card.top_up(5)
		expect(card.balance).to eq 5 

		end
    
    it 'does not allow negative amounts' do 
    expect { card.top_up(-2) }.to raise_error "Does not accept negative amounts"
      
    end
    
    it "has a £#{OysterCard::MAX_AMOUNT} limit on top ups" do
      card.top_up(OysterCard::MAX_AMOUNT)
      expect { card.top_up(1) }.to raise_error "You have reached £#{OysterCard::MAX_AMOUNT}"
    end
	end
  
  describe '#touch_in' do
    
    it 'updates the in_journey? status to true' do
      card.top_up(2)
      card.touch_in("")
      expect(card).to be_in_journey
    end

    it "raises an error if the current balance is less than £#{OysterCard::MIN_AMOUNT}" do
      expect{ card.touch_in("") }.to raise_error "Insufficient balance - Minimum required: £#{OysterCard::MIN_AMOUNT}"
    end

    it 'stores the entry station' do
      card.top_up(90)
      card.touch_in("King's Cross")
      expect(card.entry_station).to eq "King's Cross"
    end
  end
  
  describe '#in-journey' do
    
    it 'should have an initial status of false' do
      
      expect(card).not_to be_in_journey
    end
  end

  
  describe '#touch_out' do
    
    before(:each) do
      card.top_up(5)
      card.touch_in("King's Cross")
      card.touch_out("Finsbury Park")
    end
    
    it 'updates the in_journey status to false' do
      expect(card).not_to be_in_journey
      
   end
   
    it 'deducts the minimum fare from the balance' do
     expect(card.balance).to eq(5 - OysterCard::MIN_FARE) 
   end

   it 'should reset @entry_station to nil' do
    expect(card.entry_station).to eq nil
   end
   
   
  end
  
  
end




