class Roadtrip
	attr_accessor :id, :start_city, :end_city, :travel_time, :weather_at_eta
  
	def initialize(id = "null", data)
		@id = id
		@start_city = data[:start_city]
		@end_city = data[:end_city]
		@travel_time = data[:travel_time]
		@weather_at_eta = data[:weather_at_eta]
	end
end