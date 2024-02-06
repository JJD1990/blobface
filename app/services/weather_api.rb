require 'httparty'
class WeatherApi
    include HTTParty
    base_uri 'api.openweathermap.org/data/2.5'
  
    def self.fetch_weather(city)
      api_key = Rails.application.credentials.weather_api[:key]
      response = get("/weather?q=#{city}&appid=#{api_key}&units=metric")
      if response.success?
        response.parsed_response
      else
        { error: "Unable to fetch weather data" }
      end
    end
end
  