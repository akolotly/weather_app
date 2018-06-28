require 'open_weather'

class GetWeather
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


# list.main.temp Температура.
# list.main.pressure Атмосферное давление
# list.main.humidity Влажность,%
# list.wind.speed  Скорость ветра.
# list.weather.description  =>"облачно"
# list.dt_txt:"2018-06-28 09:00:00" дата
