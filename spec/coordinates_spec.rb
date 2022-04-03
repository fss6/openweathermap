# frozen_string_literal: true

RSpec.describe "Coordinates" do
  it "has Coordinates instance" do
    coordinates = OpenWeatherMap::Coordinates.new(0.123, 1.456)
    expect(coordinates).to be_a_kind_of(OpenWeatherMap::Coordinates)
  end

  it "Coordinates raises ArgumentError" do
    expect { OpenWeatherMap::Coordinates.new }.to raise_error(ArgumentError)
  end

  it "Coordinates has lat and lon" do
    lon = 0.123
    lat = 1.456
    coordinates = OpenWeatherMap::Coordinates.new(lon, lat)
    expect(coordinates.lat).to eq(lat)
    expect(coordinates.lon).to eq(lon)
  end
end
