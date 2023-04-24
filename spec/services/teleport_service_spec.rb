require 'rails_helper'

RSpec.describe TeleportService do
  describe 'class methods' do

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