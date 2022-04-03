# frozen_string_literal: true

require "json"
require "net/http"

require_relative "openweathermap/version"
require_relative "openweathermap/coordinates"
require_relative "openweathermap/city"
require_relative "openweathermap/weather_condition"
require_relative "openweathermap/current_weather"
require_relative "openweathermap/forecast"
require_relative "openweathermap/api"

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

    ## Exception to handle unknown location
    class UnknownLocation < OpenWeatherMap::Error; end

    ## Exception to tell that the API key isn't authorized
    class Unauthorized < OpenWeatherMap::Error; end

    ## Exception to handle data error
    class DataError < OpenWeatherMap::Error; end
  end
end
