# frozen_string_literal: true

module OpenWeatherMap
  ## Represents the current weather at a location
  class CurrentWeather
    attr_reader :weather_condition, :city

    ##
    # Create a new CurrentWeather object
    #
    # @param data [Hash] mixed data from the request
    def initialize(data)
      begin
        data = JSON.parse(data)
      rescue JSON::JSONError => e
        raise OpenWeatherMap::Exceptions::DataError, "error: #{e}"
      end
      @city = OpenWeatherMap::City.new(
        data["name"],
        data["coord"]["lon"],
        data["coord"]["lat"],
        data["sys"]["country"]
      )
      @weather_condition = OpenWeatherMap::WeatherCondition.new(data)
    end
  end
end
