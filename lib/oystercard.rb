require_relative 'journey.rb'

class OysterCard
  LIMIT = 50
  MINIMUM = 1
  attr_reader :balance

  def initialize
    @balance = 0
    @full_history = {}
    @history = []
    @journey =  Journey.new
  end


  def top_up(value)
    fail "Max reached which is #{LIMIT}" if maximum(value)
    @balance += value
  end


  def touch_in(station)
    fail "Insufficient balance #{MINIMUM}" if minimum
      if @history.length == 1
        deduct(6)
      end
      @journey.entry_station = station
    record_the_journey(station)
    time
  end

  def touch_out(station)
    deduct(10)
    @journey.exit_station = station
    record_the_journey(station)
    full_history
    "journey complete" if @journey.complete?

  end

  def time
    @time = Time.now
    @journey_time = @time.strftime("Journey date and time: %d/%m/%y  %H:%M")
  end

  def full_history
    @full_history[@journey_time] = @journey.history
    @full_history
  end

  def history
    @journey.history
  end

  private

  def record_the_journey(record)
    @history << record
  end

  def maximum(value)
    @balance + value > LIMIT
  end

  def minimum
    @balance <= MINIMUM
  end

  def deduct(value)
    @balance -= value
  end
end

