class Journey < Struct.new :entry_station, :exit_station

def in_journey?
!!entry_station
end

def complete?
  !!exit_station

end

end




