# frozen_string_literal: true

RSpec.describe 'Constants' do
  it "has a endpoint" do
    expect(OpenWeatherMap::Constants::ENDPOINT).not_to be nil
  end

  it "has a weather url" do
    expect(OpenWeatherMap::Constants::WEATHER_URL).not_to be nil
  end

  it "has a forecast url" do
    expect(OpenWeatherMap::Constants::FORECAST_URL).not_to be nil
  end
end