# frozen_string_literal: true

RSpec.describe 'CurrentWeather' do
  before do
    @data = {
      "name": "Newtonhill",
      "coord": {
        "lon": -2.15,
        "lat": 57
      },
      "sys": { "country": "GB" },
      "weather": [
        {
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "main": { "temp": 0.66 },
      "dt": 1648932292
    }
  end
  
  it "has CurrentWeather instance" do
    cw = OpenWeatherMap::CurrentWeather.new(@data.to_json)
    expect(cw).to be_a_kind_of(OpenWeatherMap::CurrentWeather)
  end

  it "CurrentWeather raises ArgumentError" do
    expect{ 
      OpenWeatherMap::CurrentWeather.new 
    }.to raise_error(ArgumentError)
  end

  it "CurrentWeather raises OpenWeatherMap::Exceptions::DataError" do
    expect{ 
      OpenWeatherMap::CurrentWeather.new("") 
    }.to raise_error(OpenWeatherMap::Exceptions::DataError)
  end
  
  it "CurrentWeather has a City" do
    cw = OpenWeatherMap::CurrentWeather.new(@data.to_json)
    expect(cw.city).to be_a_kind_of(OpenWeatherMap::City)
  end

  it "CurrentWeather has a WeatherCondition" do
    cw = OpenWeatherMap::CurrentWeather.new(@data.to_json)
    expect(cw.weather_condition).to be_a_kind_of(OpenWeatherMap::WeatherCondition)
  end
end