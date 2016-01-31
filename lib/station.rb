class Station

	attr_reader :name, :zone

	def initialize(name, zone)
		@name = name
		@zone = zone
	end
end

#@name = {name => zone}
# Angel => 1
# London_Bridge => 1
# Canada_Water => 2