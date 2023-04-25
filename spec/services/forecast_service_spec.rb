require 'rails_helper'

RSpec.describe ForecastService do
  context '::class_methods' do
    describe '#get_forecast' do
      it 'returns a forecast for a city' do
        VCR.use_cassette('forecast_service_spec') do
          lat = 39.74001
          lon = -104.99202
          forecast = ForecastService.get_forecast(lat, lon)

          expect(forecast).to be_a(Hash)

          expect(forecast).to have_key(:location)
          expect(forecast[:location]).to be_a(Hash)

          expect(forecast[:location]).to have_key(:name)
          expect(forecast[:location][:name]).to be_a(String)

          expect(forecast[:location]).to have_key(:region)
          expect(forecast[:location][:region]).to be_a(String)

          expect(forecast[:location]).to have_key(:country)
          expect(forecast[:location][:country]).to be_a(String)

          expect(forecast[:current]).to have_key(:temp_f)
          expect(forecast[:current][:temp_f]).to be_a(Float)

          expect(forecast[:current]).to have_key(:last_updated)
          expect(forecast[:current][:last_updated]).to be_a(String)

          expect(forecast[:current]).to have_key(:condition)
          expect(forecast[:current][:condition]).to be_a(Hash)

          expect(forecast[:current][:condition]).to have_key(:text)
          expect(forecast[:current][:condition][:text]).to be_a(String)

          expect(forecast[:current][:condition]).to have_key(:icon)
          expect(forecast[:current][:condition][:icon]).to be_a(String)
          
          expect(forecast[:forecast][:forecastday][0]).to have_key(:date)
          expect(forecast[:forecast][:forecastday][0][:date]).to be_a(String)
        end
      end
    end
  end
end