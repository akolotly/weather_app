require 'open_weather'

class GetWeather
  # TODO: скрыть APPID из GitHub и обновить в https://openweathermap.org
  OPTIONS = {
    units: 'metric',
    APPID: '0dcc896c370422da85a464cf7d88979d',
    lang: 'ru'
  }.freeze

  attr_reader :city

  def initialize(city)
    @city = city
  end

  # get current weather by geocode. (lat, lon)
  def call
    response = OpenWeather::Forecast.geocode(city.latitude, city.longitude, OPTIONS)
    return response if response.nil?
    converting_utc_time_into_local_city_time(response)
  end

  private

  # TODO: Протестировать, что локальное время отличается от utc и соответствует часовому поясу выбранного города
  def converting_utc_time_into_local_city_time(response)
    response.dig('list').map do |weather_for_3_hours|
      next weather_for_3_hours if weather_for_3_hours['dt_txt'].nil?
      utc_time = Time.parse(weather_for_3_hours['dt_txt'])
      local_time = utc_time.in_time_zone(@city.time_zone)
      new_weather_for_3_hours = { 'dt_txt' => local_time.strftime('%Y.%m.%d %H:%M') }
      weather_for_3_hours.merge(new_weather_for_3_hours)
    end
  end
end
