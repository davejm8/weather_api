require 'rails_helper'

RSpec.describe RoadtripFacade do
  context 'class methods' do
    describe '.get_directions' do
      it 'returns directions for a roadtrip' do
        VCR.use_cassette('roadtrip_facade_spec') do
          start = 'New York, NY'
          finish = 'Los Angeles, CA'
          roadtrip = RoadtripFacade.get_directions(start, finish)
          expect(roadtrip).to be_a(Roadtrip)

          expect(roadtrip.start_city).to eq('New York, NY')
          expect(roadtrip.end_city).to eq('Los Angeles, CA')

          expect(roadtrip.travel_time).to be_a(String)

          expect(roadtrip.weather_at_eta).to be_a(Hash)

          expect(roadtrip.weather_at_eta).to have_key(:datetime)
          expect(roadtrip.weather_at_eta[:datetime]).to be_a(String)

          expect(roadtrip.weather_at_eta).to have_key(:temperature)
          expect(roadtrip.weather_at_eta[:temperature]).to be_a(Float)

          expect(roadtrip.weather_at_eta).to have_key(:condition)
          expect(roadtrip.weather_at_eta[:condition]).to be_a(String)
        end
      end

      it 'returns impossible if the trip is impossible' do
        VCR.use_cassette('roadtrip_facade_impossible') do
          start = 'New York, NY'
          finish = 'London, UK'
          roadtrip = RoadtripFacade.get_directions(start, finish)
          expect(roadtrip).to be_a(Roadtrip)

          expect(roadtrip.start_city).to eq('New York, NY')
          expect(roadtrip.end_city).to eq('London, UK')

          expect(roadtrip.travel_time).to eq("impossible")

          expect(roadtrip.weather_at_eta).to eq({})
        end
      end
    end
  end
end