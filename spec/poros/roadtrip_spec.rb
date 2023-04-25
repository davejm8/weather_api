require 'rails_helper'

RSpec.describe Roadtrip do
  it 'createss a roadtrip object with attributes' do
    data = {
      id: "null",
      start_city: "New York, NY",
      end_city: "Los Angeles, CA",
      travel_time: "40:10:42",
      weather_at_eta: {
      datetime: "2023-04-27 06:00",
      temperature: 63.3,
      condition: "Clear"
      }
    }

    roadtrip = Roadtrip.new(data)

    expect(roadtrip.id).to eq("null")
    expect(roadtrip.start_city).to eq("New York, NY")
    expect(roadtrip.end_city).to eq("Los Angeles, CA")
    expect(roadtrip.travel_time).to eq("40:10:42")
    expect(roadtrip.weather_at_eta).to be_a(Hash)
    expect(roadtrip.weather_at_eta[:temperature]).to eq(63.3)
    expect(roadtrip.weather_at_eta[:condition]).to eq("Clear")
  end
end