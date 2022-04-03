# frozen_string_literal: true

module OpenWeatherMap
  ## Represents a city
  class City
    attr_reader :name, :country, :coordinates

    ##
    # Create a new City object
    #
    # @param name [String] City's name
    # @param country [String] Country in which the city is
    # @param lon [Float] Longitude of the city
    # @param lat [Float] Latitude of the city
    def initialize(name, country, lon, lat)
      @name = name
      @country = country
      @coordinates = OpenWeatherMap::Coordinates.new(lon, lat)
    end
  end
end
