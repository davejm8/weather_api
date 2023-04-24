require 'rails_helper'

RSpec.describe 'Salaries API' do
  it 'returns a successful response' do
    get '/api/v1/salaries?destination=chicago'
    
    expect(response).to be_successful

    salaries = JSON.parse(response.body, symbolize_names: true)

    expect(salaries).to have_key(:data)
    expect(salaries[:data]).to have_key(:id)
    expect(salaries[:data][:id]).to eq("null")

    expect(salaries[:data]).to have_key(:type)
    expect(salaries[:data][:type]).to eq("salaries")
  end
end