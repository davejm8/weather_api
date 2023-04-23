require 'rails_helper'

RSpec.describe ForecastFacade do
  context 'class methods' do
    describe '.get_forecast' do
      it 'returns a forecast for a city' do
        VCR.use_cassette('/spec/facades/forecast_facade_spec.rb', record: :all) do
          forecast = ForecastFacade.get_forecast('denver','co')

          expect(forecast).to be_a(Forecast)
        end
      end
    end
  end
end