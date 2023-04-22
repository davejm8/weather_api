class ForecastService
  def get_forecast(location)
    response = conn.get("forecast.json?key=#{ENV['WEATHER_API_KEY']}&q=#{location}")
  end

  private
  def conn
    Faraday.new(url:"http://api.weatherapi.com/v1")
  end
end