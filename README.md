# OpenWeatherMap

An implementation to use the OpenWeatherMap API.

## Requirements 

```ruby
ruby >= "2.6.0"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "openweathermap", git: "https://github.com/fss6/openweathermap.git", branch: "main"
```
And then execute:

```bash
$ bundle install
```

or

```bash
 $ git clone "https://github.com/fss6/openweathermap.git"
 $ cd openweathermap
 $ gem build openweathermap.gemspec
 $ gem install openweathermap-0.1.0.gem
```

## Usage

### Setup
Include the openweathermap library in your project:
```ruby
include 'openweathermap'
```

Initialize the OpenWeatherMap API:
```ruby
api = OpenWeatherMap::API.new(API_KEY, LANG)
```
The initialize parameters:
* API_KEY: get your api on the website 
* LANG: supported languages that you can use with the corresponded lang values:
    * [af] Afrikaans
    * [al] Albanian
    * [ar] Arabic
    * [az] Azerbaijani
    * [bg] Bulgarian
    * [ca] Catalan
    * [cz] Czech
    * [da] Danish
    * [de] German
    * [el] Greek
    * [en] English
    * [eu] Basque
    * [fa] Persian (Farsi)
    * [fi] Finnish
    * [fr] French
    * [gl] Galician
    * [he] Hebrew
    * [hi] Hindi
    * [hr] Croatian
    * [hu] Hungarian
    * [id] Indonesian
    * [it] Italian
    * [ja] Japanese
    * [kr] Korean
    * [la] Latvian
    * [lt] Lithuanian
    * [mk] Macedonian
    * [no] Norwegian
    * [nl] Dutch
    * [pl] Polish
    * [pt] Portuguese
    * [pt_br] Português Brasil (DEFAULT)
    * [ro] Romanian
    * [ru] Russian
    * [sv, se]	Swedish
    * [sk] Slovak
    * [sl] Slovenian
    * [sp, es]	Spanish
    * [sr] Serbian
    * [th] Thai
    * [tr] Turkish
    * [ua, uk] Ukrainian
    * [vi] Vietnamese
    * [zh_cn] Chinese Simplified
    * [zh_tw] Chinese Traditional
    * [zu] Zulu

  
### Get current weather

To get the current weather at a certain city:
```ruby
location = "Recife"
api.current(location)
```
or

```ruby
lat = -8.05389
lon = -34.88111
location = [lon, lat]
api.current(location)
```

for more detail: https://openweathermap.org/current

### Get forecast

To get the forecast for a certain city:

```ruby
location = "Recife"
api.forecast(location)
```
or

```ruby
lat = -8.05389
lon = -34.88111
location = [lon, lat]
api.forecast(location)
```

for more detail: https://openweathermap.org/forecast5

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/openweathermap. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/openweathermap/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenWeatherMap project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/openweathermap/blob/master/CODE_OF_CONDUCT.md).
