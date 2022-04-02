# frozen_string_literal: true

RSpec.describe 'WeatherConditions' do
  before do
    @data = {
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
    wc = OpenWeatherMap::WeatherConditions.new(@data.to_json)
    expect(wc).to be_a_kind_of(OpenWeatherMap::WeatherConditions)
  end

  it "CurrentWeather raises ArgumentError" do
    expect{ 
      OpenWeatherMap::WeatherConditions.new 
    }.to raise_error(ArgumentError)
  end

  it "CurrentWeather raises OpenWeatherMap::Exceptions::DataError" do
    expect{ 
      OpenWeatherMap::WeatherConditions.new("") 
    }.to raise_error(OpenWeatherMap::Exceptions::DataError)
  end
  
  it "WeatherConditions has main, description and temperature" do
    wc = OpenWeatherMap::WeatherConditions.new(@data.to_json)
    expect(wc.main).to eq(@data[:weather][0][:main])
    expect(wc.description).to eq(@data[:weather][0][:description])
    expect(wc.temperature).to eq(@data[:main][:temp])
  end

  it "WeatherConditions has a time" do
    wc = OpenWeatherMap::WeatherConditions.new(@data.to_json)
    expect(wc.time).to be_a_kind_of(Time)
    expect(wc.time).to eq(Time.at(@data[:dt]))
  end
end