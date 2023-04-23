class Forecast
  attr_reader :id, :type, :forecast, :current_weather, :daily_weather, :hourly_weather

  def initialize(forecast)
    @id = "null"
    @type = "forecast"
    @current_weather = current_weather(forecast[:current])
    @daily_weather = daily_weather(forecast[:forecast][:forecastday])
    @hourly_weather = hourly_weather(forecast[:forecast][:forecastday][0][:hour])
  end

  def current_weather(stats)
    {
      last_updated: stats[:last_updated],
      temp: stats[:temp_f],
      feels_like: stats[:feelslike_f],
      humidity: stats[:humidity],
      uvi: stats[:uv],
      visibility: stats[:vis_miles],
      conditions: stats[:condition][:text],
      icon: stats[:condition][:icon]  
    }
  end

  def daily_weather(stats)
      stats.map do |stat|
    {
      date: stat[:date],
      sunrise: stat[:astro][:sunrise],
      sunset: stat[:astro][:sunset],
      max_temp: stat[:day][:maxtemp_f],
      min_temp: stat[:day][:mintemp_f],
      conditions: stat[:day][:condition][:text],
      icon: stat[:day][:condition][:icon]
    }
      end
  end

  def hourly_weather(stats)
    stats.map do |stat|
      {
        time: stat[:time],
        temp: stat[:temp_f],
        conditions: stat[:condition][:text],
        icon: stat[:condition][:icon]
      }
    end
  end
end