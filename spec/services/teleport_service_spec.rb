require 'rails_helper'

RSpec.describe TeleportService do
  describe 'class methods' do
    it 'returns city data' do
      location = TeleportService.get_city('chicago')

      expect(location).to be_a(Hash)

      expect(location).to have_key(:_embedded)
      expect(location[:_embedded]).to be_a(Hash)
      
      expect(location[:_embedded]).to have_key(:"city:search-results")
      expect(location[:_embedded][:"city:search-results"]).to be_a(Array)

      expect(location[:_embedded][:"city:search-results"][0]).to have_key(:matching_full_name)
      expect(location[:_embedded][:"city:search-results"][0][:matching_full_name]).to be_a(String)
    end
    

    it 'returns salary data' do
      
      salaries = TeleportService.get_salaries('chicago')
      
      expect(salaries).to be_a(Hash)

      expect(salaries).to have_key(:salaries)
      expect(salaries[:salaries]).to be_a(Array)

      expect(salaries[:salaries][0]).to have_key(:job)
      expect(salaries[:salaries][0][:job]).to be_a(Hash)

      expect(salaries[:salaries][0][:job]).to have_key(:title)
      expect(salaries[:salaries][0][:job][:title]).to be_a(String)

      expect(salaries[:salaries][0]).to have_key(:salary_percentiles)
      expect(salaries[:salaries][0][:salary_percentiles]).to be_a(Hash)
    end
  end

end