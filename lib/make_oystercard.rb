class OysterCard
  LIMIT = 50
  MINIMUM = 1
attr_reader :balance, :entry_station, :exit_station, :journey_history
  def initialize
    @balance = 0
    @journey = false
    @entry_station = nil
    @journey_history = []
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
    @exit_station = nil
    @entry_station = station
    record_the_journey(station)
  end
  def touch_out(station)
    deduct(10)
    @entry_station = nil
    @exit_station = station
    record_the_journey(station)
  end
  def record_the_journey(record)
    @journey_history << record
  end
  private
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
