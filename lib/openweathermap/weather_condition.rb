# frozen_string_literal: true

module OpenWeatherMap
  ## Represents the weather conditions
  class WeatherCondition
    attr_reader :time, :main, :description, :temperature

    ##
    # Create a new WeatherCondition object.
    #
    # @param data [Hash] all the received data
    def initialize(data)
      @time = Time.at(data["dt"])
      @main = data["weather"][0]["main"]
      @description = data["weather"][0]["description"]
      @temperature = data["main"]["temp"]
    end
  end
end