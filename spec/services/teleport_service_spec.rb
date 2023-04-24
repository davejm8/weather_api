require 'rails_helper'

RSpec.describe TeleportService do
  it 'returns city data' do
    VCR.use_cassette('teleport_service_spec', record: :once) do
      city = TeleportService.get_city('chicago')

      expect(city).to be_a(Hash)

      expect(city).to have_key(:_embedded)
      expect(city[:_embedded]).to be_a(Hash)

      expect(city[:_embedded]).to have_key(:city:search-results)
      expect(city[:_embedded][:city:search-results]).to be_a(Array)

      expect(city[:_embedded][:city:search-results][0]).to have_key(:matching_full_name)
      expect(city[:_embedded][:city:search-results][0][:matching_full_name]).to be_a(String)

      expect(city[:_embedded][:city:search-results][0]).to have_key(:href)
      expect(city[:_embedded][:city:search-results][0][:href]).to be_a(String)
    end
  end
end