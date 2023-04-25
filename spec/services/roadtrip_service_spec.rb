require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  context '::class_methods' do
    describe '#get_roadtrip' do
      it 'returns directions for a road trip' do
        VCR.use_cassette('roadtrip_service_spec') do
          start = 'New York, NY'
          finish = 'Los Angeles, CA'
          roadtrip = RoadtripService.get_directions(start, finish)
          expect(roadtrip).to be_a(Hash)

          expect(roadtrip).to have_key(:route)
          expect(roadtrip[:route]).to be_a(Hash)

          expect(roadtrip[:route]).to have_key(:formattedTime)
          expect(roadtrip[:route][:formattedTime]).to be_a(String)
        end
      end
    end
  end
end