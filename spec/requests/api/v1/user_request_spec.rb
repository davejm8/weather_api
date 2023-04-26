require 'rails_helper'

RSpec.describe 'User API' do
  let(:user_params) do
    {
      email: "example@example.com",
      password: "password",
      password_confirmation: "password"
    }
  end

  let(:incomplete_user_params) do
    {
      email: "example@example.com",
      password: "password",
      password_confirmation: "pas"
    }
  end

  let(:missing_user_params) do
    {
      email: "",
      password: "password",
      password_confirmation: "password"
    }
  end

  before :each do
    User.destroy_all
  end

  it 'creates a new user and generates an api key' do
    post '/api/v1/users', params: user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response.status).to eq(201)

    users = JSON.parse(response.body, symbolize_names: true)
    expect(users[:data][:type]).to eq('user')
    expect(users[:data][:attributes][:email]).to eq(user_params[:email])
    expect(users[:data][:attributes][:api_key]).to_not be_nil
  end

  it 'returns an error if incomplete' do
    post '/api/v1/users', params: incomplete_user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response.status).to eq(400)

    users = JSON.parse(response.body, symbolize_names: true)
    expect(users[:error]).to eq("Password confirmation doesn't match Password")
  end

  it 'returns an error if invalid' do
    post '/api/v1/users', params: missing_user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response.status).to eq(400)

    users = JSON.parse(response.body, symbolize_names: true)
    expect(users[:error]).to eq("Email can't be blank")
  end
end