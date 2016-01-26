class OysterCard
  LIMIT = 50
  MINIMUM = 1
attr_reader :balance, :entry_station
  def initialize
    @balance = 0
    @journey = false
    @entry_station = nil
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
  end
  def touch_out
    deduct(10)
    @entry_station = nil
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
