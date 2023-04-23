require 'rails_helper'

RSpec.describe 'Weather API' do

  it 'returns a successful response' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end

  it 'returns a JSON response' do
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:description)
    
    expect(forecast[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:max)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:min)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:description)
    
    expect(forecast[:data][:attributes][:hourly_weather]).to be_an(Array)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:temp)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:description)
  end
end