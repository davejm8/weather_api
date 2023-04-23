require 'rails_helper'

RSpec.describe Forecast do
	describe '#initialize' do
			it 'creates a forecast object' do
				current_weather = {
          "last_updated": "2023-04-23 11:45",
          "temperature": 42.8,
          "feels_like": 40.7,
          "humidity": 51,
          "uvi": "null",
          "visibility": 9,
          "condition": "Partly cloudy",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
        }

				daily_weather = [
          {
          "date": "2023-04-23",
          "sunrise": "06:11 AM",
          "sunset": "07:46 PM",
          "max_temp": 59.5,
          "min_temp": 34,
          "condition": "Sunny",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
          },
          {
          "date": "2023-04-24",
          "sunrise": "06:10 AM",
          "sunset": "07:47 PM",
          "max_temp": 64,
          "min_temp": 43.3,
          "condition": "Partly cloudy",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
          },
          {
          "date": "2023-04-25",
          "sunrise": "06:08 AM",
          "sunset": "07:48 PM",
          "max_temp": 58.3,
          "min_temp": 35.4,
          "condition": "Heavy rain",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/308.png"
          },
          {
          "date": "2023-04-26",
          "sunrise": "06:07 AM",
          "sunset": "07:49 PM",
          "max_temp": 47.7,
          "min_temp": 33.3,
          "condition": "Heavy rain",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/308.png"
          },
          {
          "date": "2023-04-27",
          "sunrise": "06:06 AM",
          "sunset": "07:50 PM",
          "max_temp": 66.4,
          "min_temp": 36.9,
          "condition": "Sunny",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
          }
          ]

					hourly_weather = [
            {
            "time": "2023-04-23 00:00",
            "temperature": 36.5,
            "conditions": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
            },
            {
            "time": "2023-04-23 01:00",
            "temperature": 36,
            "conditions": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
            },
            {
            "time": "2023-04-23 02:00",
            "temperature": 35.8,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 03:00",
            "temperature": 35.6,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 04:00",
            "temperature": 35.1,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 05:00",
            "temperature": 34.5,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 06:00",
            "temperature": 34,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 07:00",
            "temperature": 34.9,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 08:00",
            "temperature": 37.2,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 09:00",
            "temperature": 40.1,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 10:00",
            "temperature": 43.5,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 11:00",
            "temperature": 48.9,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 12:00",
            "temperature": 52,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 13:00",
            "temperature": 55,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 14:00",
            "temperature": 57.6,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 15:00",
            "temperature": 58.6,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 16:00",
            "temperature": 59.5,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 17:00",
            "temperature": 59.4,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 18:00",
            "temperature": 58.5,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 19:00",
            "temperature": 57,
            "conditions": "Sunny",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
            "time": "2023-04-23 20:00",
            "temperature": 53.1,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 21:00",
            "temperature": 50.9,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 22:00",
            "temperature": 49.5,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
            "time": "2023-04-23 23:00",
            "temperature": 48.6,
            "conditions": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
            }
            ]

				forecast = Forecast.new(current_weather, daily_weather, hourly_weather)
				expect(forecast).to be_a(Forecast)
				expect(forecast.id).to eq("null")
				expect(forecast.type).to eq("forecast")
				expect(forecast.current_weather).to eq(current_weather)
				expect(forecast.daily_weather).to eq(daily_weather)
				expect(forecast.hourly_weather).to eq(hourly_weather)
		end
	end
end