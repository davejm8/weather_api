require 'rails_helper'

RSpec.describe TeleportService do
  it 'returns city data' do
    city = TeleportService.get_urban_area('chicago')

    expect(city).to be_a(Hash)
    # expect(city['_links']['ua:item'])
  end
end