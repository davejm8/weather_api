class ForecastFacade
  def self.get_forecast(location)
    latlon = MapquestService.get_location(location)
    lat = latlon[:lat]
    lon = latlon[:lng]
    forecast = ForecastService.get_forecast(lat, lon)
    Forecast.new(forecast)
  end
end