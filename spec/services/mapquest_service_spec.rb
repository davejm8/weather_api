require 'rails_helper'

RSpec.describe MapquestService do
  it 'returns a location for a city' do
    VCR.use_cassette('/spec/services/mapquest_service_spec.rb', record: :all) do
    location = MapquestService.get_location('denver,co')

    expect(location).to be_a(Hash)
  
    expect(location).to have_key(:lat)
    expect(location[:lat]).to be_a(Float)

    expect(location).to have_key(:lng)
    expect(location[:lng]).to be_a(Float)
    end
  end
end