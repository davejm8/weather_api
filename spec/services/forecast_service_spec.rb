require 'rails_helper'

RSpec.describe ForecastService do
  it 'returns a forecast for a city' do
    forecast = ForecastService.new.get_forecast('denver,co')

    expect(forecast).to be_a(Hash)
  end
end