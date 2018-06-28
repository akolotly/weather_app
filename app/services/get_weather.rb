require 'open_weather'

class GetWeather
  # TODO: скрыть APPID из GitHub и обновить в https://openweathermap.org
  OPTIONS = { units: "metric", APPID: "0dcc896c370422da85a464cf7d88979d", lang: 'ru' }

  def initialize(city)
    @lat = city.latitude
    @lon = city.longitude
  end

  # get current weather by geocode. (lat, lon)
  def call
    OpenWeather::Forecast.geocode(@lat, @lon, OPTIONS)
  end
end
