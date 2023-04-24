require 'rails_helper'

RSpec.describe Salary, type: :model do
  describe 'initialize' do
    it 'creates a salary object with attributes' do
      city = { destination: 'chicago' }
      forecast = { summary: 'Sunny', temperature: 72 }
      salaries = [
        { title: 'Software Engineer', min: 60_000, max: 90_000 }
      ]

      salary = Salary.new("null", "salaries", city, forecast, salaries)
      expect(salary.id).to eq("null")
      expect(salary.type).to eq("salaries")
      expect(salary.city[:destination]).to eq("chicago")
      expect(salary.forecast[:summary]).to eq("Sunny")
      expect(salary.forecast[:temperature]).to eq(72)
      expect(salary.salaries[0][:title]).to eq("Software Engineer")
      expect(salary.salaries[0][:min]).to eq(60000)
      expect(salary.salaries[0][:max]).to eq(90000)
    end
  end
end
