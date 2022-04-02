# frozen_string_literal: true

RSpec.describe OpenWeatherMap do
  it "has a version number" do
    expect(OpenWeatherMap::VERSION).not_to be nil
  end
end
