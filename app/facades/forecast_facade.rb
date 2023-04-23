class ForecastFacade
  def self.get_forecast(lat, lon)
    Forecast.new(service.get_forecast(lat, lon))
  end

  def self.service
    ForecastService.new
  end
end