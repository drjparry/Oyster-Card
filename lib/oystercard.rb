require_relative 'journey.rb'

class OysterCard
  LIMIT = 50
  MINIMUM = 1
  attr_reader :balance, :exit_station, :history

  def initialize
    @balance = 0
    @history = []
    @full_history = {}
  end


  def top_up(value)
    fail "Max reached which is #{LIMIT}" if maximum(value)
    @balance += value


  end


  def touch_in(station)
    fail "Insufficient balance #{MINIMUM}" if minimum
    @journey =  Journey.new station
    record_the_journey(station)
    time

    @journey_complete = false

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
    @full_history[@journey_time] = @history
    @full_history
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


#journey = Journey.new
#p journey.entry_station
