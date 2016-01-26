class OysterCard
  LIMIT = 50
attr_reader :balance
  def initialize
    @balance = 0
  end
  def top_up(value)
    fail "Max reached which is #{LIMIT}" if @balance + value > LIMIT
    @balance += value
  end
  def deduct(value)
    @balance -= value
  end
end
