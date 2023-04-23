# require 'rails_helper'

# RSpec.describe MapquestFacade do
#   let(:facade) { MapquestFacade.new }

#   it 'returns a location for a city' do
#     VCR.use_cassette('/spec/services/mapquest_service_spec.rb', record: :all) do
#       location = facade.get_location('denver,co')
# require 'pry'; binding.pry
#       expect(location).to be_a(Array)
#       expect(location.lat).to eq(39.738453)
#     end
#   end
# end