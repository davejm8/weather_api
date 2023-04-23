require 'rails_helper'

RSpec.describe 'Weather API' do

  it 'returns a successful response' do
    VCR.use_cassette('/spec/requests/forecast_request.rb', record: :all) do
      require 'pry'; binding.pry
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      
      forecast = JSON.parse(response.body, symbolize_names: true)
     
      expect(forecast).to have_key(:id)
      expect(forecast[:id]).to be_a(String)
      expect(forecast[:id]).to eq("null")

      expect(forecast).to have_key(:type)
      expect(forecast[:type]).to be_a(String)
      expect(forecast[:type]).to eq("forecast")

      expect(forecast).to have_key(:daily_weather)
      expect(forecast[:daily_weather]).to be_an(Array)

      expect(forecast).to have_key(:hourly_weather)
      expect(forecast[:hourly_weather]).to be_an(Array)

      expect(forecast).to have_key(:current_weather)
      expect(forecast[:current_weather]).to be_a(Hash)
    end
  end
end