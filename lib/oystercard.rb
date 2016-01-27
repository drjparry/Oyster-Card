class OysterCard
  LIMIT = 50
  MINIMUM = 1
  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
    @journey = false
    @history = []
    @full_history = {}
  end


  def top_up(value)
    fail "Max reached which is #{LIMIT}" if maximum(value)
    @balance += value
  end

  def in_journey?
    entry_station
  end

  def touch_in(station)
    fail "Insufficient balance #{MINIMUM}" if minimum
    @entry_station = station
    record_the_journey(station)
    time

  end

  def touch_out(station)
    deduct(10)
    @exit_station = station
    record_the_journey(station)
    full_history
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
