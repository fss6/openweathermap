# frozen_string_literal: true

require_relative "lib/openweathermap/version"

Gem::Specification.new do |spec|
  spec.name = "openweathermap"
  spec.version = OpenWeatherMap::VERSION
  spec.authors = ["Fabio Santos"]
  spec.email = ["fabiosantos.pe@gmail.com"]

  spec.summary = "Implementation of OpenWeatherMap API."
  spec.description = "An implementation to use the OpenWeatherMap API."
  spec.homepage = "https://github.com/fss6/openweathermap"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = [
    "lib/openweathermap.rb",
    "lib/openweathermap/version.rb",
    "lib/openweathermap/coordinates.rb",
  ]

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
