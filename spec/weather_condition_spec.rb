# frozen_string_literal: true

RSpec.describe 'WeatherCondition' do
  before do
    @data =  JSON.parse({
      "weather": [
        {
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "main": { "temp": 0.66 },
      "dt": 1648932292
    }.to_json)
  end
  
  it "has CurrentWeather instance" do
    wc = OpenWeatherMap::WeatherCondition.new(@data)
    expect(wc).to be_a_kind_of(OpenWeatherMap::WeatherCondition)
  end

  it "CurrentWeather raises ArgumentError" do
    expect{ 
      OpenWeatherMap::WeatherCondition.new 
    }.to raise_error(ArgumentError)
  end
  
  it "WeatherCondition has main, description and temperature" do
    wc = OpenWeatherMap::WeatherCondition.new(@data)
    expect(wc.main).to eq(@data["weather"][0]["main"])
    expect(wc.description).to eq(@data["weather"][0]["description"])
    expect(wc.temperature).to eq(@data["main"]["temp"])
  end

  it "WeatherCondition has a time" do
    wc = OpenWeatherMap::WeatherCondition.new(@data)
    expect(wc.time).to be_a_kind_of(Time)
    expect(wc.time).to eq(Time.at(@data["dt"]))
  end
end