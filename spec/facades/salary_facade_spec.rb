require 'rails_helper'

RSpec.describe SalaryFacade do
  describe '.salary_data' do
    let(:location) { 'chicago' }
    let(:forecast_data) { instance_double(Forecast) }
    let(:teleport_data) { 
      {
        salaries: [
          {
            job: { title: 'Software Engineer' },
            salary_percentiles: {
              percentile_25: 60000,
              percentile_75: 90000
            }
          }
        ]
      }
    }

    before do
      allow(TeleportService).to receive(:get_salaries).with(location).and_return(teleport_data)
      allow(ForecastFacade).to receive(:get_forecast).with(location).and_return(forecast_data)
      allow(forecast_data).to receive(:current_weather).and_return({
        condition: 'Sunny',
        temperature: 72
      })
    end

    it 'returns a Salary object with the correct data' do
      salary = SalaryFacade.salary_data(location)

      expect(salary).to be_a(Salary)
      expect(salary.city[:destination]).to eq(location)
      expect(salary.forecast[:summary]).to eq('Sunny')
      expect(salary.forecast[:temperature]).to eq(72)
      expect(salary.salaries[0][:title]).to eq('Software Engineer')
      expect(salary.salaries[0][:min]).to eq(60000)
      expect(salary.salaries[0][:max]).to eq(90000)
    end
  end
end