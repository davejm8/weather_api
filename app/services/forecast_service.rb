class ForecastService
  def conn
    Faraday.new(url: 'https://api.weatherapi.com/v1/') do |faraday|
      faraday.params['key'] = ENV['WEATHER_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_forecast(lat, lon)
    response = conn.get("forecast.json?q=#{lat},#{lon}&days=5")
    JSON.parse(response.body, symbolize_names: true)
  end
end