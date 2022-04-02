# frozen_string_literal: true

RSpec.describe 'City' do
  it "has City instance" do
    city = OpenWeatherMap::City.new("City name", "Country name", 0.123, 1.456)
    expect(city).to be_a_kind_of(OpenWeatherMap::City)
  end

  it "City raises ArgumentError" do
    expect{ OpenWeatherMap::City.new }.to raise_error(ArgumentError)
  end

  it "City has name and country" do
    name = "City name"
    country = "Country name"
    city = OpenWeatherMap::City.new(name, country, 0.123, 1.456)
    expect(city.name).to eq(name)
    expect(city.country).to eq(country)
  end

  it "City has a Coordinates instance" do
    city = OpenWeatherMap::City.new("City name", "Country name", 0.123, 1.456)
    expect(city.coordinates).to be_a_kind_of(OpenWeatherMap::Coordinates)
  end
end