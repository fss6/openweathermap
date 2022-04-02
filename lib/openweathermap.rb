# frozen_string_literal: true

require 'json'

require_relative "openweathermap/version"
require_relative "openweathermap/coordinates"
require_relative "openweathermap/city"
require_relative "openweathermap/weather_conditions"
require_relative "openweathermap/current_weather"

module OpenWeatherMap
  class Error < StandardError; end
  
  ## All the constants needed for the library
  module Constants
    ENDPOINT = "https://api.openweathermap.org"
    WEATHER_URL = "/data/2.5/weather"
    FORECAST_URL = "/data/2.5/forecast"
  end

  module Exceptions
    ## Exception to handle data error
    class DataError < OpenWeatherMap::Error; end
  end
end

