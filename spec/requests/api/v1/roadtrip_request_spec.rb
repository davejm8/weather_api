require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  let(:user) { User.create!(email: 'test@test.email', password: 'password') }

  let(:roadtrip) do
    {
				"origin": "Portland,ME",
				"destination": "Atlanta,GA",
				"api_key": user.api_key
			}
  end
  
  let(:impossible_trip) do
    {
      "origin": "Portland,ME",
      "destination": "London,UK",
      "api_key": user.api_key
    }
  end


  it 'sends road trip information' do
    VCR.use_cassette('roadtrip_request_spec') do
      post '/api/v1/road_trip', params: roadtrip.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response.status).to eq(200)
      trip = JSON.parse(response.body, symbolize_names: true)

      expect(trip).to be_a(Hash)
      expect(trip).to have_key(:data)

      expect(trip[:data]).to be_a(Hash)
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data][:id]).to eq("null")

      expect(trip[:data]).to have_key(:type)
      expect(trip[:data][:type]).to eq("roadtrip")

      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to be_a(Hash)

      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes][:start_city]).to eq("Portland,ME")

      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes][:end_city]).to eq("Atlanta,GA")

      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes][:travel_time]).to eq("18:55:12")

      expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    end
  end


  it 'sends impossible trip information' do
    VCR.use_cassette('roadtrip_request_impossible') do
      post '/api/v1/road_trip', params: impossible_trip.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      
      expect(response.status).to eq(200)

      trip = JSON.parse(response.body, symbolize_names: true)
      
      expect(trip).to be_a(Hash)

      expect(trip[:data][:attributes][:travel_time]).to eq("impossible")
      expect(trip[:data][:attributes][:weather_at_eta]).to eq({})
    end
  end

  # VCR.use_cassette('roadtrip_request_impossible') do
  #   it 'sends impossible trip information' do
  #     post '/api/v1/road_trip', params: no_api_key.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      
  #     expect(response.status).to eq(401)
      
  #     trip = JSON.parse(response.body, symbolize_names: true)
      
  #     expect(trip).to be_a(Hash)

  #     expect(trip[:data][:attributes][:travel_time]).to eq("impossible")
  #     expect(trip[:data][:attributes][:weather_at_eta]).to eq({})
  #   end
  # end
end