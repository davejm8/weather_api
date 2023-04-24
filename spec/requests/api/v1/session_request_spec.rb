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

  let(:bad_login_params) do
    {
      email: "",
      password: "123123"
    }
  end

  before(:each) do
    post "/api/v1/users", params: user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response.status).to eq(201)
  end

  it 'creates a new session with a successful login' do
    post "/api/v1/sessions", params: login_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response.status).to eq(200)
  end

  it 'does not create a new session with an unsuccessful login' do
    post "/api/v1/sessions", params: bad_login_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response.status).to eq(401)
  end
end