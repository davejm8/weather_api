require 'rails_helper'

RSpec.describe ForecastFacade do
  context 'class methods' do
    describe '.get_forecast' do
      it 'returns a forecast for a city' do
        VCR.use_cassette('forecast_facade_spec') do
          forecast = ForecastFacade.get_forecast('denver,co')

          expect(forecast).to be_a(Forecast)
          expect(forecast.current_weather[:last_updated]).to eq("2023-04-23 11:30")
          expect(forecast.current_weather[:temperature]).to eq(42.8)
          expect(forecast.current_weather[:feels_like]).to eq(40.7)
          expect(forecast.current_weather[:humidity]).to eq(51)
          expect(forecast.current_weather[:uvi]).to eq(nil)
          expect(forecast.current_weather[:visibility]).to eq(9.0)
          expect(forecast.current_weather[:condition]).to eq("Partly cloudy")
          expect(forecast.current_weather[:icon]).to eq("//cdn.weatherapi.com/weather/64x64/day/116.png")
        end
      end
      it 'returns only the atrributes from the facade' do
        VCR.use_cassette('forecast_facade_spec') do
          forecast = ForecastFacade.get_forecast('denver,co')

          expect(forecast).to be_a(Forecast)
          expect(forecast.current_weather).to_not have_key(:current)
          expect(forecast.current_weather).to_not have_key(:location)
          expect(forecast.current_weather).to_not have_key(:forecast)
        end
      end
    end
  end
end