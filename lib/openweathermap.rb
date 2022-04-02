# frozen_string_literal: true

require_relative "openweathermap/version"
require_relative "openweathermap/coordinates"
require_relative "openweathermap/city"

module OpenWeatherMap
  class Error < StandardError; end
  
  ## All the constants needed for the library
  module Constants
    ENDPOINT = "https://api.openweathermap.org"
    WEATHER_URL = "/data/2.5/weather"
    FORECAST_URL = "/data/2.5/forecast"
  end
end

