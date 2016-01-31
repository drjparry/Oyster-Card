require 'station'

	describe Station do
    	subject {described_class.new(name: "Angel", zone: 1)}
    	it 'knows the name' do
    		expect(subject.name).to eq("Angel")
    	end
    	it 'knows the zone' do
    		expect(subject.zone).to eq(1)
    	end
  	end
