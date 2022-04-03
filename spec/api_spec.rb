# frozen_string_literal: true

RSpec.describe "API" do
  before do
    @api_key = "SVAgaswu1f3" # fake
    @location = [-2.15, 57]
  end

  it "has API instance" do
    api = OpenWeatherMap::API.new(@api_key)
    expect(api).to be_a_kind_of(OpenWeatherMap::API)
  end

  it "API raises ArgumentError" do
    expect do
      OpenWeatherMap::API.new
    end.to raise_error(ArgumentError)
  end

  it "API raises OpenWeatherMap::Exceptions::Unauthorized" do
    api = OpenWeatherMap::API.new(@api_key)
    expect do
      api.current(@location)
    end.to raise_error(OpenWeatherMap::Exceptions::Unauthorized)
    expect do
      api.forecast(@location)
    end.to raise_error(OpenWeatherMap::Exceptions::Unauthorized)
  end
end
