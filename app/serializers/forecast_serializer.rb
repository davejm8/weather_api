class ForecastSerializer
  include JSONAPI::Serializer
  attributes :type, :id, :current_weather, :daily_weather, :hourly_weather
end