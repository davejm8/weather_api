![360_F_162153873_HGC6xpCvh84YkGRVXeJEEQgRidKK4NzB](https://user-images.githubusercontent.com/116821829/234410474-a7b4874b-0545-45ca-8c6d-3439a6d016a0.jpg)


### Weather API

is an API-based application that provides weather forecast and road trip planning services. It uses MapQuest's Geocoding and Directions API and OpenWeatherMap's Weather API to retrieve the necessary data.

Learning Goals
Practice designing and building API endpoints
Utilize third-party APIs
Implement user authentication and authorization
Write tests for API endpoints
Follow JSON API 1.0 specification
Use JSON serialization
Setup
To set up this application on your local machine, follow these steps:

### Installation/ Use

_Follow the steps below to install and set up this app._

1. Sign up for an [Mapquest API Key]https://developer.mapquest.com/documentation/geocoding-api through Mapquest

2. Sign up for a [Weather API Key]https://www.weatherapi.com

3. Clone this Repository
   ```
    git clone https://github.com/davejm8/weather_api
   ```
4. In your terminal, run the following commands;
    ```sh
    bundle install
    bundle exec figaro install
    rails db:{drop,create,migrate,seed}
    ```
5. Enter your API Keys in `application.yml`
   
   ```
    weather_api_key: 'your key here'
    mapquest_api_key: 'your key here'
   ```
6. Retrieve the weather for your city;
    ```sh
    GET /api/v0/forecast?location=<city,state>
    Content-Type: application/json
    Accept: application/json

    Response body
    {
      "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
          "current_weather": {
            "last_updated": "2023-04-07 16:30",
            "temperature": 55.0,
            "feels_like": 53.1,
            "humidity": 60.0,
            "uvi": 5.0,
            "visibility": 10.0,
            "condition": "cloudy",
            "icon": "04d.png"
          },
          "daily_weather": [
            {
              "date": "2023-04-07",
              "sunrise": "07:13 AM",
              "sunset": "08:07 PM",
              "max_temp": 60.0,
              "min_temp": 52.1,
              "condition": "partly cloudy",
              "icon": "03d.png"
            },
            {...} etc
          ],
          "hourly_weather": [
            {
              "time": "14:00",
              "temperature": 54.5,
              "conditions": "cloudy",
              "icon": "04d.png"
            },
            {...} etc
          ]
        }
      }
    }
    ```
7. Register a new user;
    ```sh
    POST /api/v0/users
    Content-Type: application/json
    Accept: application/json
    
    Request Body(raw, JSON)
    {
      "email": "user@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    ```
8. Log in as a user;
    ```sh
    POST /api/v0/sessions

    Content-Type: application/json
    Accept: application/json

    Request Body(raw, JSON)
    {
     "email": "example@example.com",
      "password": "password"
    }
    ```
7. Get directions and weather for a road trip;
    ```sh
    POST /api/v1/road_trip
    Content-Type: application/json
    Accept: application/json

    Request Body(raw, JSON)
    {
				"origin": "Portland,ME",
				"destination": "Atlanta,GA",
				"api_key": "your_api_key_here"
			}
    ```

### Weather API solo project

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/davejm8"></td>
  </tr>
  <tr>
    <td>David Marino</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/davejm8">GitHub</a><br>
      <a href="https://www.linkedin.com/in/davidjmarino8/">LinkedIn</a>
    </td>
</table>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
