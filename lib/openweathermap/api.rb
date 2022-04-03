# frozen_string_literal: true

module OpenWeatherMap
  # The main API class.
  class API
    attr_reader :lang, :units

    ##
    # Initialize the API object
    #
    # @param api_key [String] your OpenWeatherMap's API key
    def initialize(api_key, lang = "pt_br")
      @api_key = api_key
      @lang = lang
      @units = "metric"
    end

    ##
    # Get current weather at a specific location.
    #
    # @param location [String, Array] the location
    #   Can be one of this type :
    #   - String : search by city name
    #   - Array : search by coordinates (format : [lon, lat])
    # @return [OpenWeatherMap::CurrentWeather] requested data
    def current(location)
      weather_url = OpenWeatherMap::Constants::WEATHER_URL
      data = make_request(weather_url, location)
      OpenWeatherMap::CurrentWeather.new(data)
    end

    ##
    # Get weather forecast for a specific location.
    #
    # @param location [String, Array] the location
    #   Can be one of this type :
    #   - String : search by city name
    #   - Array : search by coordinates (format : [lon, lat])
    # @return [OpenWeatherMap::Forecast] requested data
    def forecast(location)
      forecast_url = OpenWeatherMap::Constants::FORECAST_URL
      data = make_request(forecast_url, location)
      OpenWeatherMap::Forecast.new(data)
    end

    private

    ##
    # Make a request to the OpenWeatherMap API.
    #
    # @param url [String] The endpoint to reach
    # @param options [Hash] mixed options
    # @return [String] request's body
    def make_request(url, location)
      options = make_location(location)

      params = {
        appid: @api_key,
        lang: @lang,
        units: @units
      }
      params.merge! options

      url = "#{OpenWeatherMap::Constants::ENDPOINT}/#{url}"
      uri = URI("#{url}?#{URI.encode_www_form(params)}")
      response = Net::HTTP.get_response(uri)
      case response.code.to_i
      when 401
        msg = "unauthorized key. API message : #{response.message}"
        raise OpenWeatherMap::Exceptions::Unauthorized, msg
      when 404
        msg = "unknown location. API message : #{location}"
        raise OpenWeatherMap::Exceptions::UnknownLocation, msg
      else response.body
      end
    end

    def make_location(location)
      options = {}
  
      if location.is_a? String
        options[:q] = location
      elsif location.is_a? Array
        options[:lon] = location[0]
        options[:lat] = location[1]
      end
      options
    end
  end
end
