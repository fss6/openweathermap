# frozen_string_literal: true

RSpec.describe "CurrentWeather" do
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
    }.to_json
  end

  it "has CurrentWeather instance" do
    cw = OpenWeatherMap::CurrentWeather.new(@data)
    expect(cw).to be_a_kind_of(OpenWeatherMap::CurrentWeather)
  end

  it "CurrentWeather raises ArgumentError" do
    expect do
      OpenWeatherMap::CurrentWeather.new
    end.to raise_error(ArgumentError)
  end

  it "CurrentWeather raises OpenWeatherMap::Exceptions::DataError" do
    expect do
      OpenWeatherMap::CurrentWeather.new("")
    end.to raise_error(OpenWeatherMap::Exceptions::DataError)
  end

  it "CurrentWeather has a City" do
    cw = OpenWeatherMap::CurrentWeather.new(@data)
    expect(cw.city).to be_a_kind_of(OpenWeatherMap::City)
    data = JSON.parse(@data)
    expect(cw.city.name).to eq(data["name"])
    expect(cw.city.country).to eq(data["sys"]["country"])
    expect(cw.city.coordinates.lon).to eq(data["coord"]["lon"])
    expect(cw.city.coordinates.lat).to eq(data["coord"]["lat"])
  end

  it "CurrentWeather has a WeatherCondition" do
    cw = OpenWeatherMap::CurrentWeather.new(@data)
    expect(cw.weather_condition).to be_a_kind_of(OpenWeatherMap::WeatherCondition)
  end
end
