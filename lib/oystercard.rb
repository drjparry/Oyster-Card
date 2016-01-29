

require_relative 'station'
require_relative 'journey'

class OysterCard

 attr_reader :balance, :entry_station, :history
 attr_accessor :journey, :fare

 MAX_AMOUNT = 90
 MIN_AMOUNT = 1
 MIN_FARE = 2
 PENALTY_CHARGE = 6

	def initialize
		@balance = 0
    @history = []
    @entry_station = nil
	end

  def in_journey?
    !!@entry_station
  end

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAX_AMOUNT}" if balance + amount > MAX_AMOUNT
		@balance += amount
	end


  def touch_in(station)
    fail "Insufficient balance - Minimum required: £#{MIN_AMOUNT}" if balance < MIN_AMOUNT
    deduct(@journey.fare) if @entry_station
    self.entry_station = station
    start_journey
  end

  def touch_out(station)
     end_journey(station)
    deduct(@journey.fare)
    self.entry_station = nil
  end

  private

  attr_writer :balance, :entry_station, :history

  def deduct(amount)
    self.balance -= amount
  end

  def start_journey
    @journey = Journey.new(@entry_station, nil, in_journey?)
    history << @journey.create
  end

  def end_journey(station)
    if self.in_journey?
      self.journey[:exit_station] = station
      history.pop                           # completes the "temporary" initial journey hash
      history << self.journey.complete      # by overwriting it
    else
      @journey = Journey.new(nil, station, in_journey?)
      history << @journey.complete
    end
  end
end