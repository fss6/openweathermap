# frozen_string_literal: true

module OpenWeatherMap
  ## Represents a location's coordinates
  class Coordinates
    attr_reader :lon, :lat

    ##
    # Create a new Coordinates object
    #
    # @param lon [Float] Longitude of the location
    # @param lat [Float] Latitude of the location
    def initialize(lon, lat)
      @lon = lon
      @lat = lat
    end
  end
end
