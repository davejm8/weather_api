require 'rails_helper'

RSpec.describe MapquestService do
  it 'returns a location for a city' do
    VCR.use_cassette('/spec/services/mapquest_service_spec.rb', record: :all) do
    location = MapquestService.new.get_location('denver,co')

    expect(location).to be_a(Hash)

    expect(location).to have_key(:results)
    expect(location[:results]).to be_an(Array)

    expect(location[:results][0]).to have_key(:locations)
    expect(location[:results][0][:locations]).to be_an(Array)

    expect(location[:results][0][:locations][0]).to have_key(:latLng)
    expect(location[:results][0][:locations][0][:latLng]).to be_a(Hash)

    expect(location[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(location[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)

    expect(location[:results][0][:locations][0][:latLng]).to have_key(:lng)
    expect(location[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end
  end
end