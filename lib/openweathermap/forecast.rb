# frozen_string_literal: true

module OpenWeatherMap
  ## Represents the current weather at a location
  # Represents the forecast for a specific location
  class Forecast
    attr_reader :city, :weather_conditions

    ##
    # Create a new Forecast object
    #
    # @param data [Hash] mixed data from the request
    def initialize(data)
      begin
        data = JSON.parse(data)
      rescue JSON::JSONError => e
        raise OpenWeatherMap::Exceptions::DataError, "error: #{e}"
      end
      @city = OpenWeatherMap::City.new(
        data["city"]["name"],
        data["city"]["country"],
        data["city"]["coord"]["lon"],
        data["city"]["coord"]["lat"]
      )
      @weather_conditions = data["list"].collect do |w|
        OpenWeatherMap::WeatherCondition.new(w)
      end
    end
  end
end
