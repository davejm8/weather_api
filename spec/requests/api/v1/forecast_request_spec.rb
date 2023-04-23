require 'rails_helper'

RSpec.describe 'Weather API' do

  it 'returns a successful response' do
    VCR.use_cassette('mapquest_request') do
      get '/api/v1/forecast?location=denver,co'
  
      expect(response).to be_successful
      
      forecast = JSON.parse(response.body, symbolize_names: true)
      
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq("null")
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq("forecast")

      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to have_key(:current_weather)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:last_updated)
      expect(forecast[:data][:attributes][:current_weather][:last_updated]).to be_a(String)

      expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    end
  end
end