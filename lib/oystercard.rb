require_relative 'location.rb'
require_relative 'station.rb'

class Oystercard

attr_reader :balance, :entry_location, :journey
attr_accessor :history

MAX_LIMIT = 90
SINGLE_JOURNEY = 1


  def initialize
  @balance = 0
  @journey = []
  @history = Hash.new
 # @journey = Journey1:{["entry_location" => entry_location, "exit_location => exit_location"]}
 # @journey = journey:{ "jounrey" => [@entry_location, @exit_location]
  end

  def top_up(amount)
  fail "Maximum limit of #{MAX_LIMIT} reached" if balance_exceeded(amount)
  @balance += amount
  end

  def touch_in(location)
  fail "insufficient funds" if balance < SINGLE_JOURNEY
  @entry_location = location
  @journey<<@entry_location

  end

  def touch_out(location)
  @exit_location = location
  deduct(SINGLE_JOURNEY)
  @journey<<@exit_location
  @history = { "journey" => [@entry_location, @exit_location] }
  clear_entry_location
  end

  def in_journey?
    !!entry_location
  end

  def where
    station.zone
  end


  private

	def balance_exceeded(amount)
  (@balance + amount) > MAX_LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end

  def clear_entry_location
    @entry_location = nil
  end


end


