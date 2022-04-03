# frozen_string_literal: true

RSpec.describe 'Forecast' do
  before do
    @data = {
      "city": {
        "name": "Newtonhill",
        "coord": {
            "lat": 57,
            "lon": -2.15
        },
        "country": "GB",
      },
      "list": [
        {
          "dt": 1649019600,
          "main": { "temp": 8.56 },
          "weather": [
            {
              "main": "Rain",
              "description": "light rain"
            }
          ]
        },
        {
          "dt": 1649030400,
          "main": { "temp": 9.43 },
          "weather": [
            {
              "main": "Rain",
              "description": "light rain",
            }
          ]
        }
      ]
    }.to_json
  end
  
  it "has Forecast instance" do
    forecast = OpenWeatherMap::Forecast.new(@data)
    expect(forecast).to be_a_kind_of(OpenWeatherMap::Forecast)
  end

  it "Forecast raises ArgumentError" do
    expect{ 
      OpenWeatherMap::Forecast.new 
    }.to raise_error(ArgumentError)
  end

  it "Forecast raises OpenWeatherMap::Exceptions::DataError" do
    expect{ 
      OpenWeatherMap::Forecast.new("") 
    }.to raise_error(OpenWeatherMap::Exceptions::DataError)
  end
  
  it "Forecast has a City" do
    forecast = OpenWeatherMap::Forecast.new(@data)
    expect(forecast.city).to be_a_kind_of(OpenWeatherMap::City)
  end

  it "Forecast has many WeatherConditions" do
    forecast = OpenWeatherMap::Forecast.new(@data)
    expect(forecast.weather_conditions.first).to be_a_kind_of(OpenWeatherMap::WeatherCondition)
    expect(forecast.weather_conditions.size).to be == 2
  end
end