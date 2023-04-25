class RoadtripFacade

  def self.get_directions(start, finish)
    roadtrip = RoadtripService.get_directions(start, finish)
    location = MapquestService.get_location(finish)

    lat = location[:lat]
    long = location[:lng]
    forecast = ForecastService.get_forecast(lat, long)

    formatted_time = roadtrip[:route][:formattedTime]
    travel_time = roadtrip[:route][:time]
    arrival = Time.now + travel_time

    if roadtrip[:info][:statuscode] == 402
			data = {
				id: "null",
				start_city: start,
				end_city: finish,
				travel_time: "impossible",
				weather_at_eta: {}
			}
			return Roadtrip.new(data)
      
    else
      forecast[:forecast][:forecastday].each do |day|
        if arrival.to_s.include?(day[:date])
          day[:hour].each do |hour|
            if arrival <= Time.parse(hour[:time]) + 1.hour && arrival >= Time.parse(hour[:time])
              data = {
								id: "null",
								start_city: start,
								end_city: finish,
								travel_time: formatted_time,
								weather_at_eta: {
									datetime: hour[:time],
									temperature: hour[:temp_f],
									condition: hour[:condition][:text]
								}
							}
							return Roadtrip.new(data)
            end
          end
        end
      end
    end
  end
end