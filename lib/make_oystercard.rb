class OysterCard
  LIMIT = 50
attr_reader :balance
  def initialize
    @balance = 0
    @journey = false
  end
  def top_up(value)
    fail "Max reached which is #{LIMIT}" if @balance + value > LIMIT
    @balance += value
  end
  def deduct(value)
    @balance -= value
  end
  def in_journey?
    @journey
  end
  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end
end
