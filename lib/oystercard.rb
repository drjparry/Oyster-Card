require_relative 'journey.rb'
require_relative 'journeylog.rb'
require_relative 'station.rb'

class OysterCard

    MIN_BALANCE = 1
  	MAX_BALANCE = 90
	attr_reader :balance, :journey

	  def initialize
      @journeylog = JourneyLog.new
      @journey    = Journey.new
    	@balance    = 0
  	end

  	def top_up(value)
    	raise "Amount exceeds the limit: #{MAX_BALANCE}" if @balance +value > MAX_BALANCE
    	@balance += value
  	end

    def touch_in(station)
      raise 'not enough funds' if MIN_BALANCE > @balance
      @journey.touch_in2(station)
      @journeylog.start_journey(station)
      deduct
    end

    def touch_out(station)
      deduct
      @journey.touch_out2(station)
      @journeylog.exit_journey(station)
    end

private

  def deduct(value)
  	@balance -= value
  	return value
	end

end
