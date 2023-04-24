require 'rails_helper'

RSpec.describe 'Session API' do
  let(:user_params) do
    {
      email: "email@email.com",
      password: "password",
      password_confirmation: "password"
    }
  end

  let(:login_params) do
    {
      email: "email@email.com",
      password: "password"
    }
  end

  before(:each) do
    post "/api/v1/users", params: user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response.status).to eq(201)
  end

  # it 'creates a new session with a successful login' do
    
  # end
end