# frozen_string_literal: true

module OpenWeatherMap
  ## Represents the weather conditions
  class WeatherConditions
    attr_reader :time, :main, :description, :temperature

    ##
    # Create a new WeatherConditions object.
    #
    # @param data [Hash] all the received data
    def initialize(data)
      begin
        data = JSON.parse(data)
      rescue JSON::JSONError => e
        raise OpenWeatherMap::Exceptions::DataError, "error while parsing data : #{e}"
      end
      @time = Time.at(data["dt"])
      @main = data["weather"][0]["main"]
      @description = data["weather"][0]["description"]
      @temperature = data["main"]["temp"]
    end
  end
end