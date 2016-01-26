class OysterCard
  LIMIT = 50
  MINIMUM = 1
attr_reader :balance
  def initialize
    @balance = 0
    @journey = false
  end
  def top_up(value)
    fail "Max reached which is #{LIMIT}" if maximum(value)
    @balance += value
  end
  def in_journey?
    @journey
  end
  def touch_in
    fail "Insufficient balance #{MINIMUM}" if minimum
    @journey = true
  end
  def touch_out
    deduct(10)
    @journey = false
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
